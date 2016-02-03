
# Welcome to
# Sydney Elixir
## 13th January 2016
---
* **What's been happening** (Elixir 1.2, etc)
* **Intro to Elm** (Igor Kapkov)
* **Intro to Ecto** (Garrett Heinlein)
* **Web Apps without Phoenix** (Dylan Griffith)
* **Hangout** (Dinner/drinks @ Pumphouse Tavern)

---
# Elixir v1.2
## upgrade now!
### (kiex is useful for managing versions)
---
## Requires Erlang 18+

  * Maps can now scale to millions of keys
  * `Dict` and `HashDict` *deprecated*
    * Use `Map` instead
  * `Set` and `HashSet` *deprecated*
    * Use `MapSet` instead
  * Compilation times are faster!

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
# Interesting Things

* Phoenix 1.1.2 out
    - Upgrade instruction (https://gist.github.com/chrismccord/557ef22e2a03a7992624)
    - `@inner` becomes explicit `render @view_module, @view_template, assigns`
    - ecto changes
* Alpine Linux for Elixir/Phoenix (https://github.com/bitwalker/alpine-elixir-phoenix)

---
# More Interesting Things

* Rendering React with Phoenix (http://blog.overstuffedgorilla.com/render-react-with-phoenix)
    - Uses https://github.com/mjackson/react-stdio
* Be careful with Websockets (https://samsaffron.com/archive/2015/12/29/websockets-caution-required)
* Pinterest notifications are now 100% Elixir
* Help Jose win at Github https://github.com/nashby/jose-vs-oss

---
# More Interesting Things

* Microsoft EOLs IE < 11 (finally!)
* https://github.com/bigardone/phoenix-trello
* OpenGL / WX definitions in Erlang (code on elixir-lang-talk) (talk to robin@rocketboots.com)
* Improper List vs Proper List don't do this:
```
iex(2)> [1,2] ++ 2
[1, 2 | 2]
```

---
# Tips and Tricks

* Elixir plugin for (Oh My) Zsh (https://github.com/gusaiani/elixir-oh-my-zsh)
* Spacemacs and Alchemist.el (Garrett couldn't figure it out but is still trying)
* Using Macro could be really slow, use code gen instead
* Elixir Exercism is useful for learning (good discussions)
* Crazy code golfing 2D maze solver in 6 lines in Elixir (https://gist.github.com/sj26/9806fb25265984837886)

---
# Scaling Elixir Meetups

Lots of interest this month (25 RSVPs!)

---
# Jobs!

## Looking / Hiring?

* Blake

Are both looking for devs to build Elixir APIs early next year
