# Sydney Elixir
## 2nd December 2015
---
* **What's been happening** (Elixir 1.2, etc)
* **Intro to Plugs** (Josh Price)
* **Intro to Macros** (James Sadler)
* **Elixir Deployment** (Toby Hede)
* **Hangout** (Dinner/drinks @ Pumphouse Tavern)

---
# Elixir v1.2
---
## Requires Erlang 18+
---
## Erlang 18 support

  * Maps can now scale to millions of keys
  * `Dict` and `HashDict` will be *deprecated*
    * Use `Map` instead
  * `Set` and `HashSet` will be *deprecated*
    * Use `MapSet` instead
  * Compilation times are faster
    * How is this even possible?

---
# Language improvements
---
## Multi aliases/imports/require
    alias MyApp.{Foo, Bar, Baz}
---
## Variables in map keys
    %{key => value}
---
## Pin operator in map keys and functions

(NB: The pin operator prevents variable rebinding)

    %{^key => value} = %{key => value}
    fn ^key -> :ok end
---
## `with` special form
* match on multiple expressions

        with {:ok, contents} <- File.read("my_file.ex"),
                {res, binding} <- Code.eval_string(contents),
                do: {:ok, res}

* `pipe` seems very useful
  * deals with `{:ok|:error, x}` chains

---
# Tips and Tricks

* https://github.com/batate/elixir-pipes#pipe_matching
* `v(line_number)` or `v(-1)` for value in iex at that line
* `i/1` inspects value in iex
* erlang-history https://github.com/ferd/erlang-history
* `h()` in iex shows help
* Phoenix gets grumpy with bad mime types
    - register custom mime types before use

---
# More Tips and Tricks

* Admin layout using pipeline and plugs
* Switch to emacs (actually spacemacs)
* Beware of char lists when JSON decoding `Poison.decode ~S({"foo": [35,35]})` => `{:ok, %{"foo" => '##'}}`
* Mex (https://github.com/mrluc/mex) for macro debugging
* PragProg `turkeyday2015` 40% off
* Dialyxir (https://github.com/jeremyjh/dialyxir)

---
# Jobs!

## Looking / Hiring?

* Zova
* Blake

Are both looking for devs to build Elixir APIs early next year
