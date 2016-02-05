build-lists: true
# GenServer
## A Generic Server Behaviour

---
# Behaviours

> Design patterns for processes
--Benjamin Tan Wei Hao

> A behaviour is a way to say: give me a module as argument and I will invoke the following callbacks on it, with these argument and so on.
-- Jose Valim

> A behaviour module for implementing the server of a client-server relation.
-- Erlang docs


---
# Other Behaviours

- Supervisor
- Application
- GenEvent
- GenFsm

---

# Common server features

* Spawn a separate process
* Maintain state
* Handle requests and sending responses
* Server lifecycle

---

# Implementer Provides:

* Initial state
* Kinds of messages the server handles
* When to reply or not
* What to reply with
* State change
* Resource cleanup on termination

---

# How does it work?

Genserver expects the module it is used in to define a set of callbacks

The callbacks are invoked when the corresponding GenServer functions are called

GenServer maintains state, message handling, callback invocation

---
# Callbacks 

* `init(args)` - called on start, sets initial state
* `handle_call(msg, {from, ref} , state)` - handles sync msgs
* `handle_cast(msg, state)` - handles async messages

---
# Callbacks(cont.) 

* `handle_info(msg, state)` - all other messages
* `terminate(reason, state)` - server about to terminate
* `code_change (old_vsn, state, extra)` - hot code swapping

These are implemented and never called directly

---

# GenServer functions

* `start` and `start_link` - callback 
* `call`
* `cast`
* `reply`

These form the basis of the client interface

---

# Implementation

* Define the callbacks 

* Interface functions (API)

* Usually in the same file

---

## Implementation

Use the Genserver behaviour in your module

``` elixir
  defmodule MyStore do
    use GenServer
  end
```

---
## Implementation - init

define _init_

``` elixir
  def init(_) do
    { :ok, Map.new }
  end
```

Returns a tuple of :ok and the initial server state

---
## Implementation - call

call - synchronous

``` elixir
  def handle_call({:get, key}, _from, state) do
    {:reply, Map.get(state, key), state}
  end
```

Returns a tuple consisting of :reply, the data to be sent back to the caller and the new state

---

## Implementation - cast

cast - asynchronous

``` elixir
  def handle_cast({:put, key, value}, state) do
    {:noreply, Map.put(state, key, value)}
  end
```

Returns a tuple consisting of :noreply and the new state

---

## Implementation - other

Other callbacks left as an exercise for the reader

Callbacks can have different return values allowing slightly different behaviour

- {:reply, reply, new_state}
- {:reply, reply, new_state, timeout}
- {:reply, reply, new_state, :hibernate}

---

## Running the server

Start the server

``` elixir
  {:ok, store} = GenServer.start(Store, nil)
```

calls the `init` callback with args as the argument

---

## Using GenServer directly

```elixir
iex(4)> {:ok, store } = GenServer.start(Store, nil)
Store init
{:ok, #PID<0.112.0>}
iex(5)> GenServer.cast(store, {:put, :elixir, 1000})
Store put
:ok
iex(6)> GenServer.call(store, {:get, :elixir})      
Store get
1000
```
---
## Implementation - Define the client interface

Define functions that call the GenServer function with the appropriate arguments.

```elixir
defmodule Store do
  use GenServer
  # client interface
  def start do
    GenServer.start(__MODULE__, nil)
  end

  def put(pid, key, value) do
    GenServer.cast(pid, {:put, key, value})
  end

  def get(pid, key) do
    GenServer.call(pid, {:get, key})
  end
```
---
## Using the Client

```elixir
iex(19)> {:ok, store}= Store.start                  
Store init
{:ok, #PID<0.201.0>}
iex(20)> Store.put(store, :elm, 3000)                       
Store put
:ok
iex(21)> Store.get(store, :elm) 
Gst.Store get
3000
:ok
```
---
# DEMO TIME

---
# RESOURCES

[genserver101 repo](https://github.com/martinstannard/genserver101.git)
[Elixir in Action](https://manning.com/books/elixir-in-action)
[The Little Elixir and OTP Guidebook](https://www.manning.com/books/the-little-elixir-and-otp-guidebook)

@_martinS_
martin@stannard.id.au

