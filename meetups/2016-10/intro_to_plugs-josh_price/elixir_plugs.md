footer: © Josh Price, 2016

# Elixir Plugs
## Josh Price
## @joshprice
---
# Simple
## (Mostly)
---
## Part of Elixir core
### *github.com/elixir-lang/plug*
---
# What is a Plug?
---
### Specification for
## *composable modules*
### between web apps
---
## *Connection adapter*
### for web servers
### in the Erlang VM
---
## So a lot like
## *Rack*
## really
---
## *Phoenix* is based heavily on Plugs
---
## Everything is a Plug
### (Almost)
---
# 2 types
* Function
* Module

---
# Function Plug

* any function
* takes connection + options
* returns a connection

```elixir
    (Plug.Conn.t, Plug.opts) :: Plug.Conn.t

    def p(conn, _opts) do
        conn |> do_something
    end
```

---
What is `Plug.Conn`?

```elixir
    %Plug.Conn{
        host: "www.example.com",
        path_info: ["bar", "baz"],
        ...}
```

---
Direct *conn*ection to underlying webserver

---
Holds all header, request and response info

---
Passed all the way through the plug pipeline

---
```elixir
iex(9)> %Plug.Conn{}
%Plug.Conn{adapter: {Plug.Conn, :...}, assigns: %{}, before_send: [],
 body_params: %Plug.Conn.Unfetched{aspect: :body_params},
 cookies: %Plug.Conn.Unfetched{aspect: :cookies}, halted: false,
 host: "www.example.com", method: "GET", owner: nil,
 params: %Plug.Conn.Unfetched{aspect: :params}, path_info: [], peer: nil,
 port: 0, private: %{},
 query_params: %Plug.Conn.Unfetched{aspect: :query_params}, query_string: "",
 remote_ip: nil, req_cookies: %Plug.Conn.Unfetched{aspect: :cookies},
 req_headers: [], request_path: "", resp_body: nil, resp_cookies: %{},
 resp_headers: [{"cache-control", "max-age=0, private, must-revalidate"}],
 scheme: :http, script_name: [], secret_key_base: nil, state: :unset,
 status: nil}
```
---
# Module plug

* `init(options)` initialises options
* `call(conn, options)` same as a function plug

The result of `init/1` is passed to `call/2`

`init/1` may be called during compilation

---
# Function Plug Example
```elixir
    def json_header_plug(conn, _opts) do
      conn |> put_resp_content_type("application/json")
    end
```
---
## Module Transformation
```elixir
    defmodule JSONHeaderPlug do
      def init(opts) do
        opts
      end

      def call(conn, _opts) do
        conn |> put_resp_content_type("application/json")
      end
    end
```

---
## Module Responder
```elixir
    defmodule MyPlug do

      @behaviour Plug

      def init(options) do
        options
      end

      def call(conn, _opts) do
        conn
        |> put_resp_content_type("text/plain")
        |> send_resp(200, "Hello world")
      end
    end
```
---
# Testing a Plug
```elixir
    defmodule MyPlugTest do
      use ExUnit.Case, async: true
      use Plug.Test

      test "returns hello world" do
        # Create a test connection
        conn = conn(:get, "/hello")

        # Invoke the plug
        conn = MyPlug.call(conn, [])

        # Assert the response and status
        assert conn.state == :sent
        assert conn.status == 200
        assert conn.resp_body == "Hello world"
      end
    end
```

---
`Plug.Builder`

helps build plug pipelines

---
# Pipeline example
```elixir
    defmodule MyPlugPipeline do
      use Plug.Builder

      plug Plug.Logger
      plug :hello, upper: true

      # A function from another module can be plugged too, provided it's
      # imported into the current module first.
      import AnotherModule, only: [interesting_plug: 2]
      plug :interesting_plug

      def hello(conn, opts) do
        body = if opts[:upper], do: "WORLD", else: "world"
        send_resp(conn, 200, body)
      end
    end
```

---
### Plugs all the way down

![fit](http://imgs.xkcd.com/comics/lisp.jpg)
