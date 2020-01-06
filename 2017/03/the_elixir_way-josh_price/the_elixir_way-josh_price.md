footer: © Josh Price, 2016

# The Elixir Way
## A Case Study
## Josh Price
## @joshprice

---
# The Problem

Find the maximum delta between consecutive elements of a list

```elixir
[1, 3, 6, 10]
# => 4
```

---
# The Solution(s)

Ideas?

Describe some possible approaches (no wrong answers)

-

---
# Possible Solution #1

## The Ruby Way

```elixir
# def max_delta_rubyish([h | t]) do
#   t
#   |> Enum.reduce([h], fn x, acc -> [abs(val - h)] end)
#   |> Enum.max
# end
```

---
# Possible Solution #2

## Enum.Chunk

```elixir
def max_delta_chunky([]), do: 0
def max_delta_chunky([_]), do: 0
def max_delta_chunky(enumerable) do
  enumerable
  |> Enum.chunk(2, 1)
  |> Enum.map(fn [a,b] -> abs(b - a) end)
  |> Enum.max()
end
```

---
# Problems with the Enum way?

- Multiple passes of list
  - `chunk`, `map`, `max` (3 passes)
  - bad for bigger lists
- Otherwise pretty readable

---
# [fit] We can do
# [fit] better

---
# [fit] Don't be
# [fit] Afraid of
# [fit] Recursion

---
# Let's TDD an Elixir-y solution

- `mix new delta`
- Write some tests!
- Write the function!
- Rinse-repeat until it works

---
# Benchfella

```
✪ mix bench

## DeltaBench
benchmark name                       iterations   average time
All-in-one #0                               500   3359.19 µs/op
All-in-one #3 (diff function heads)         500   4213.13 µs/op
All-in-one #1 [a, b | _] match              500   4285.76 µs/op
delta |> max                                500   5268.05 µs/op
All-in-one #2 (extra function head)         500   5875.64 µs/op
Enum.chunk                                   50   33205.22 µs/op
```
