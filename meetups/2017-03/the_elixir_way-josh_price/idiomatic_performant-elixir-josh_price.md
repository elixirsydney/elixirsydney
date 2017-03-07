# Fast, Idiomatic and Elegant Elixir
## Recursion is your friend
## @joshprice

---
# A Simple, Contrived Problem

Write a function to find the sum of integers in a list

```elixir
Sum.sum [1, 3, 6, 10]
# => 20
```

---
# Exhibit A: What's wrong with this?

```elixir
defmodule Sum do
  def sum(list) do
    if length(list) == 0 do
      0
    else
      rest = tl(list)
      hd(list) + sum(rest)
    end
  end
end
```

=> *Please don't do this*

---
# What's wrong?

- Doesn't use pattern matching at all
- Non-idiomatic Elixir (looks suspiciously like Ruby)
- Hard to read (it can be expressed more concisely)
- Slow: checks length each time - O(n)
- Recursion is not optimal

---
# The Obvious Way

```elixir
def sum(list) do
  Enum.sum(list)
end
```

---
# Nice, Job Done!

### But can we make it better?

---
# Other Possible Approaches

```elixir
def sum(list) do
  Enum.reduce(list, 0, fn x, acc -> x + acc end)
end
```

```elixir
def sum(list) do
  Enum.reduce(list, 0, &(&1 + &2))
end
```

```elixir
def sum(list) do
  Enum.reduce(list, 0, &+/2)
end
```

---
# [fit] We can do
# [fit] better

---
# [fit] Don't be
# [fit] Afraid of
# [fit] Recursion

---
## Lists are Singly Linked Lists

```elixir
iex(1)> [1 | []]
[1]

iex(2)> [1 | [2 | [3 | []]]]
[1, 2, 3]
```
- **Efficient** to add/remove front of list `[a | list]`
- **Inefficient** to add/remove end of list `list ++ [a]`
- Getting length requires traversing whole list - O(n)

---
## Singly Linked List

![fit](https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Singly-linked-list.svg/2000px-Singly-linked-list.svg.png)

---
![fit](https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Singly-linked-list.svg/2000px-Singly-linked-list.svg.png)

---
# Pattern Matching Lists

```elixir
iex(1)> list = [1,2,3,4,5]
[1, 2, 3, 4, 5]

iex(2)> [head | tail] = list
[1, 2, 3, 4, 5]

iex(3)> head
1

iex(4)> tail
[2, 3, 4, 5]
```

- Linked lists lend themselves nicely to recursion
- Handle the head element and recurse on the tail

---
# A Recursive Approach

```elixir
defmodule SumRecursive do
  def sum([]), do: 0
  def sum([head | tail]) do
    head + sum(tail)
  end
end
```

---
# Benefits of Recursion

- Write your base case first (makes it hard to forget)
- Isolate base cases from main case (no awkward if's)
- Compact, easy to read
- Faster than using `Enum#...`

---
# But

- We have to make sure we use Tail Call Optimisation (TCO)
- Who has heard of TCO?
- Who can explain TCO?
- Who isn't sure?

---
# Tail Call Optimisation

If a recursive call
is the **last** expression,
the compiler can use a jump (or goto)
without pushing an extra stack frame

---
# TL;DR

- This is very fast and doesn't use extra memory
- No stack frames are pushed (memory is not consumed)
- Stack overflow is impossible (ie using all RAM)
- You just have to pass all of your state along

---
# Tail Call Optimised Recursion

```elixir
defmodule SumRecursiveTailCallOptimised do
  def sum(list, acc \\ 0)
  def sum([], acc), do: acc
  def sum([head | tail], acc) do
    sum(tail, head + acc)
  end
end
```

- Note the addition of the accumulator
- TCO function requires all args else it must return (ie use a stack frame)

---
# Naive Recursion v TCO

```elixir
defmodule SumRecursiveNaive do
  def sum([]), do: 0
  def sum([head | tail]), do: head + sum(tail)
end
```

```elixir
defmodule SumRecursiveTailCallOptimised do
  def sum(list, acc \\ 0)
  def sum([], acc), do: acc
  def sum([head | tail], acc), do: sum(tail, head + acc)
end
```

---
# Why is the naive not as fast as the optimised?

- Doesn't pass all required args (accumulator) so needs a stack frame
- Last expression is not a recursive call
- `+(head, sum(tail))`

---
# Function Evalution - Naive Recursion

```elixir
iex> sum([1, 2, 3])
  => 1 + sum([2, 3])
    => 2 + sum([3])
      => 3 + sum([])
        => 0
      => 3 + 0
    => 2 + 3
  => 1 + 5
=> 6
```

^ At the end we don't have the answer
^ We have to return our value to the first function call
^ Twice as long and uses memory per stack frame

---
# Function Evalution - Tail Call Optimised Recursion

```elixir
iex> sum([1, 2, 3])
  => sum([2, 3], 0 + 1)
    => sum([3], 1 + 2)
      => sum([], 3 + 3)
        => 6
```

---
# Performance: 100,000 item list

```
✪ mix bench

## SumBench
benchmark name                       iterations   average time
SumRecursiveTailCallOptimised              5000   681.91 µs/op
SumRecursive                               1000   1318.69 µs/op
SumBetter                                  1000   2822.14 µs/op
SumObvious                                 1000   2861.89 µs/op
SumRubyish                                    1   6023746.00 µs/op
```

---
# Length was the culprit in Exhibit A

- `length(list)` is `O(n)` complexity for linked lists of size `n`
- Is called `n` times resulting in `O(n^2)` total complexity
- Be very careful when using `length(list)` in your code or guards

---
# Practice with Exercism

- Lots of small problems to work on
- Try out different techniques
- Compare your answers with others
- There is an `Elixir Sydney` team
- [http://exercism.io/teams/elixir-sydney](http://exercism.io/teams/elixir-sydney)

---
# Thanks!

## Questions?
