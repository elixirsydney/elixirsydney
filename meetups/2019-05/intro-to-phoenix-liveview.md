# Intro to Phoenix LiveView

### Josh Price

### @joshprice

---

# What is Phoenix LiveView?

- Build real time, fully interactive applications
- In Elixir with no custom JavaScript
- Fully rendered Server Side
- Bidirectional communication between browser and server
- No explicit API required

---

# When to use?

- Rich experience needed, but full SPA is overkill
- Simple real-time updates
- Client-side style validations with immediate feedback
- Autocomplete inputs
- Events and updates (notifications, dashboards, etc)
- Like Elixir, and don't like JavaScript
- Enjoy simplicity, and love adventure

---

![fit](https://i.imgur.com/KycXyTx.gif)

---

# Virtual DOM

- Keeps a model of the HTML DOM
- Figures out the changes required to the real DOM
- Only applies those minimal changes
- Usually implemented in the browser
- It's what makes React, etc fast

---

# How does it work?

- Add to Phoenix
- LiveView opens a (web)socket to browser via channels
- LiveEEx manages the Virtual DOM on the _Server_
- It sends only the DOM changes needed
- Sends to browser over socket
- JS lib `MorphDOM` makes DOM changes

---

# The Basics

- Write (Live)Eex HTML template (in `render/1`)
- Use HTML attributes to send events to server (ie `phx-click`)
- Handle event by name (in `handle_event/3`)
- Update state using `update(socket, :field, value)`
- Implement `mount/2` for on load behaviour

---

![fit](https://i.imgur.com/np6tsx0.gif)

---

# Phoenix Controller

```elixir
defmodule DemoWeb.PageController do
  use DemoWeb, :controller

  def thermostat(conn, _) do
    live_render(conn, DemoWeb.ThermoStatView)
  end
end
```

---

# Phoenix View (Render)

`Phoenix.LiveView`'s built-in templates provided by the `.leex`
extension or `~L` sigil, stands for Live EEx.

```
defmodule DemoWeb.ThermostatView do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
      <div class="controls">
        <span class="reading"><%= @val %></span>
        <button phx-click="dec" class="minus">-</button>
        <button phx-click="inc" class="plus">+</button>
      </div>
    """
  end
```

---

![fit](https://i.imgur.com/P9yVFUX.png)

---

# Phoenix View (Handle Events)

```elixir
  def handle_event("inc", _, socket) do
    {:noreply, update(socket, :val, &(&1 + 1))}
  end

  def handle_event("dec", _, socket) do
    {:noreply, update(socket, :val, &(&1 - 1))}
  end

  def handle_event("toggle-mode", _, socket) do
    {:noreply,
     update(socket, :mode, fn
       :cooling -> :heating
       :heating -> :cooling
     end)}
  end
```

---

# Phoenix View (On Mount)

```elixir
  def mount(_session, socket) do
    if connected?(socket), do: Process.send_after(self(), :tick, 1000)
    {:ok, assign(socket, val: 72, mode: :cooling, time: :calendar.local_time())}
  end

  def handle_info(:tick, socket) do
    Process.send_after(self(), :tick, 1000)
    {:noreply, assign(socket, time: :calendar.local_time())}
  end
```

---

# Click Events

The `phx-click` binding is used to send click events to the server.
The `value` passed to `handle_event` is chosen on the client with the following priority:

- An optional `"phx-value"` binding on the clicked element
- The clicked element's `value` property
- An empty string

---

# Focus and Blur Events

```elixir
<input name="email" phx-focus="myfocus" phx-blur="myblur"/>
```

To detect when the page itself has receive focus or blur:

```elixir
<div class="container"
          phx-focus="page-active"
          phx-blur="page-inactive"
          phx-target="window">
</div>
```

---

# Form Events

Use the `phx-change` and `phx-submit` events to handle real-time form validation

```elixir
<%= form_for @changeset, "#", [phx_change: :validate, phx_submit: :save], fn f -> %>
```

---

### Key Events

`phx-keydown`, and `phx-keyup` sends event `key`

By default, the bound element will be the event listener, but an
optional `phx-target` may be provided which may be `"document"`,
`"window"`, or the DOM id of a target element, for example:

```elixir
  <div id="thermostat" phx-keyup="update_temp" phx-target="document">

  @up_key 38

  def handle_event("update_temp", @up_key, socket) do
```

---

# Simple!

- Tiny amounts of backend code
- No custom frontend code
- Maximum interaction
- Maximum speed

---

# Performance

- Built on top of processes and Phoenix Channels
  - scales horizontally and vertically
- Renders statically at first
  - fast to load
- `LiveEex` diffs the template
- Only sends changed dynamic values
  - fast to update

---

![fit](https://i.imgur.com/DYIv3ut.gif)

---

![fit](https://i.imgur.com/BUVnIIh.png)

---

# Installation to Phoenix

Currently LiveView is only available from GitHub. To use it, add to your `mix.exs`:

```elixir
def deps do
  [
    {:phoenix_live_view, github: "phoenixframework/phoenix_live_view"}
  ]
end
```

---

# Signing Salt

```elixir
# config/config.exs

config :my_app, MyAppWeb.Endpoint,
   live_view: [
     signing_salt: "SECRET_SALT"
   ]
```

---

# LiveView flash plug

```elixir
# lib/my_app_web/router.ex

pipeline :browser do
  ...
  plug :fetch_flash
  plug Phoenix.LiveView.Flash
end
```

---

# Expose Socket

Next, expose a new socket for LiveView updates in your app's endpoint module.

```elixir
# lib/my_app_web/endpoint.ex

defmodule MyAppWeb.Endpoint do
  use Phoenix.Endpoint

  socket "/live", Phoenix.LiveView.Socket

  # ...
end
```

---

# Add JS deps

Add LiveView NPM dependencies in your `assets/package.json`.

```json
{
  "dependencies": {
    "phoenix": "file:../deps/phoenix",
    "phoenix_html": "file:../deps/phoenix_html",
    "phoenix_live_view": "file:../deps/phoenix_live_view"
  }
}
```

Then install the new npm dependency.

```bash
npm install --prefix assets
```

---

# Connect to Live Socket

Enable connecting to a LiveView socket in your `app.js` file.

```javascript
// assets/js/app.js
import LiveSocket from "phoenix_live_view";

let liveSocket = new LiveSocket("/live");
liveSocket.connect();
```

---

# Live Reload

Live views are saved in `lib/my_app_web/live/`

```elixir
# config/dev.exs
config :demo, MyAppWeb.Endpoint,
  live_reload: [
    patterns: [
      ...,
      ~r{lib/my_app_web/live/.*(ex)$}
    ]
  ]
```

---

# Is it ready for your next app?

- No. It's not even officially released yet.
- Probably not the whole app
- Experiment with it on a small non-critical project

---

# Limitations / Roadmap

- Page navigation (no support for push state)
  - will lose back/forward button
- Cumulative data
  - chat applications, logs, etc
  - you have to a copy of all messages shown
  - no append/prepend operation
- Don't do animations use CSS

---

# Flappy Bird

- https://flappy-phoenix.herokuapp.com

---

# Further Reading

- https://github.com/phoenixframework/phoenix_live_view
- https://github.com/chrismccord/phoenix_live_view_example
