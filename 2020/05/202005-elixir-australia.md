theme: Titillium, 4
footer: @ElixirSydney, @ElixirMelbourne
header: alignment(center)

# [fit] **Elixir**
# [fit] Australia 🇦🇺
# [fit] Inaugural **Team Up**!
# **_23 May 2020_**

^
Welcome to Elixir Sydney

---

# [fit] **Tonight**
# Talks
# News / Jobs

---

# [fit] Chat

# [fit] **`elixir-slackin.herokuapp.com`**
# `#australia`

^
Since Zoom chat is ephemeral, we're going to use the #australia channel on the
Elixir lang Slack, so follow along there for internal chatter during and after
the meetup.

---

# [fit] Thanks to our
# [fit] **Sponsors**

^
First of all, I'd just like to thank our sponsor, who help make Elixir Sydney as objectively awesome as it is.<br />
Sending pizza and drinks to all of your homes wasn't really possible, so no sponsors of that nature, but...


---
[.background-color: #FFFFFF]
[.header: #7167FF]

# [fit] Thanks to our Sponsors

<br />
<br />

![inline](https://www.dropbox.com/s/a3352nwrtqb7pq3/alembic-logo.jpg?dl=1)

^
Alembic is our Zoom account sponsor tonight.
Alembic are a boutique consultancy specialising in Elixir and GraphQL. If you need a hand with a project or API, you should get in touch with them!

---
[.background-color: #FFFFFF]
[.header: #7167FF]

# [fit] Thanks to our Sponsors

<br />

![inline](https://www.dropbox.com/s/ws1rixet49itcki/lucida-logo.png?dl=1)

^
Lucida is a long time sponsor of Elixir Melbourne, so they get a shout out as well.<br />
Lucida are all about changing the culture of hiring tech talent.

---

<br />
# [fit] **TALKS**

---
[.hide-footer]

![right](https://www.dropbox.com/s/s2718zcqkc5vuk4/fiona-mccawley.jpeg?dl=1)

# [fit] **Event**
# [fit] **Sourcing**
# [fit] with **Commanded**
# [fit] *Fiona McCawley*
# [fit] **`@saucerlike`**

^
First up, we have Fiona who is going to share what she has learned about Event Sourcing and implementing it with a library called Commanded.

---
[.hide-footer]

![right](https://www.dropbox.com/s/2b98m1lgu1ohch7/julian-doherty.jpg?dl=1)

# [fit] **Randori**
# [fit] mob
# [fit] **programming**
# [fit] *Julian Doherty*
# [fit] **`@madlep`**

^
Next, we have Julian who will be leading a mob programming session with us all using the Randori format.

---

# [fit] Mob Programming

<br />
# [fit] **`https://repl.it/`**

^
We're going to try using https://repl.it/ in this scenario so we can have a live, shared code editor and repl. So, if you haven't already signed up for a Repl account and you want to participate directly in the live coding session, then please rush over to repl.it and do so.

---

![inline 3%](https://www.dropbox.com/s/am5fvlc37x3t6jm/Twitter_logo_bird_transparent_png.png?dl=1)

# [fit] `@saucerlike` **/** `@madlep`
# [fit] **`@ElixirSydney`**
# [fit] **`@ElixirMelbourne`**

^
If you're Twitter-inclined please let tonight's speakers know how much you appreciate the work they put in by tweeting about it. Giving feedback definitely makes the speakers feel their efforts have made an impact beyond building their own presentation portfolio.<br />
Don't forget to mention @ElixirSydney and @ElixirMelbourne to tie the night altogether. It also helps to fuel the hype for all our events, which is especially important and helpful for smaller events such as ours.

---

<br />
# [fit] Who's **New?**
# [fit] *Say* **_Hello!_** :wave:

^
So if you're new to Elixir Sydney can you please put up your hand, don't worry we're not going to make you stand up or say anything.  Everyone have a look around at any new people standing near you with their hands up. We're going to have a 5 minute break, so please welcome them, and we'll kick off the talks.

---

<br />
<br />
# [fit] **Thank you!**

^
Thanks so much to all the speakers tonight, and if anyone is interested in giving a talk at a future Elixir event...

---

# [fit] Talks Always
# [fit] **Welcome!**

^
- Want to hear a topic?
- Want to show off a project you've been working on?
- Want to share some interesting tips or tricks?
- Want to explore a library in more depth?

---

# [fit] Where do I sign up?

# **Sydney**
## [fit] :globe_with_meridians: *`github.com/elixirsydney/elixirsydney/issues`*

# **Melbourne**
## [fit] :globe_with_meridians: *`https://github.com/elixir-melbourne/meetup/issues`*

^
- Open up an issue at the Elixir Sydney or Elixir Melbourne Github repos and tell us about the talk you want to submit, or feel free to message any of the organisers, who are...

---

# [fit] Where do I sign up?

# **Sydney**
## [fit] `@paulfioravanti / @joshprice / @freshtonic`

# **Melbourne**
## `@madlep`

^
- Remember, It is *good* to throw yourself out of your comfort zone and try
something different, and who knows, you might even end up liking it and wanting to do more.<br />
- Also, if you need any help creating or critiquing your presentation or want someone to do a dry run, then please feel free to approach any of the organisers and we're happy to help you in any way we can to make you look awesome up on stage.

---

<br />
# [fit] **News**

^
This will end up being a bit of a lightning talk

---

# [fit] Phoenix 1.5
# [fit] **Released**

---
[.header-strong: alignment(left)]

# [fit] Phoenix 1.5

# **LiveDashboard**

^
First major and probably the headline feature of Phoenix 1.5 would be LiveDashboard

---
[.hide-footer]

![fit](https://www.dropbox.com/s/w0vtd4morwqgib8/live-dashboard.jpg?dl=1)

^
Which looks something like this.
You can probably say bye bye to using Observer for a few things since the dashboard has:<br />
- Performance monitoring and debugging tools<br />
- Charting of Phoenix events<br />
- You can add your own custom events<br />
- Integrates with telemetry, which is a library that allows you to emit events at various stages of an application's lifecycle which you can then respond to aggregating them as metrics and sending that metrics data to a reporting destination, like LiveDashboard (Qing did an Elixir Sydney talk in September 2019 about Telemetry)

---
[.header-strong: alignment(left)]

# [fit] Phoenix 1.5

# **LiveDashboard**
# **LiveView Generators**

^
Next big feature is LiveView generators.<br />
On the off-chance you don't know what LiveView is, Phoenix LiveView enables interactive, real-time user experiences with server-rendered HTML with you needing to write hardly any, if any, Javascript: basically you write "front-end" code in Elixir

---
# [fit] **LiveView Generators**

# [fit] `mix phx.new my_app --live`

^
The first LiveView generator is a --live flag to include everything you need to get up and running developing with LiveView.

---
# [fit] **LiveView Generators**

# [fit] `mix phx.new my_app --live`

```
* creating my_app/lib/my_app_web/live/page_live.ex
* creating my_app/lib/my_app_web/live/page_live.html.leex
* creating my_app/test/my_app_web/live/page_live_test.exs
* creating my_app/lib/my_app_web/templates/layout/root.html.leex
* creating my_app/lib/my_app_web/templates/layout/app.html.eex
* creating my_app/lib/my_app_web/templates/layout/live.html.leex
```

^
It will generate a live/ directory under your application web directory, and insert in a LiveView file and a Live template. I was a bit surprised to see a template here as I have been putting all templates, both live and non-live in the templates directory, but it would seem that the direction given here is that everything live should be siloed in the live directory, except for live layouts, which would seem to live in the templates/layout directory

---

# [fit] **LiveView Generators**

# [fit] `mix phx.gen.live Accounts User users name:string`

^
The next LiveView generator is phx.gen.live...

---

# [fit] **LiveView Generators**

# [fit] `mix phx.gen.live Accounts User users name:string`

```
* creating lib/my_app_web/live/user_live/show.ex
* creating lib/my_app_web/live/user_live/index.ex
* creating lib/my_app_web/live/user_live/form_component.ex
* creating lib/my_app_web/live/user_live/form_component.html.leex
* creating lib/my_app_web/live/user_live/index.html.leex
* creating lib/my_app_web/live/user_live/show.html.leex
* creating test/my_app_web/live/user_live_test.exs
* creating lib/my_app_web/live/modal_component.ex
* creating lib/my_app_web/live/live_helpers.ex
```

^
...which, similar to its non-live cousin, generates some CRUD-named LiveViews, their live templates, and a form LiveComponent, all under a resource-underscore-live namespaced directory under the live/ directory: in this case user_live.

---
[.header-strong: alignment(left)]

# [fit] Phoenix 1.5

# **LiveDashboard**
# **LiveView Generators**
# **PubSub 2.0**

^
And the final major feature of Phoenix 1.5 is PubSub 2.0 which has a...

---
[.header: alignment(left)]

# [fit] **PubSub 2.0**

## Flexible and powerful fastlane mechanism

^
...more flexible and powerful fastlane mechanism.<br />
Fastlane is a config option in the PubSub.subscribe() function that provides a fastlane path for the broadcasts for %Phoenix.Socket.Broadcast{} events whereby the fastlane process is notified of a cached message instead of the normal subscriber.

---
[.header: alignment(left)]

# [fit] **PubSub 2.0**

## Flexible and powerful fastlane mechanism
## Move Phoenix.PubSub out of app endpoint

^
Version 2.0 also moves Phoenix.PubSub out of the endpoint and explicitly into your supervision tree<br />
This prevents race conditions at startup and decouples your PubSub system from your application's endpoint.

---

# [fit] **LiveView**
# [fit] 0.12.1

^
LiveView itself is at version 0.12.1. If you use LiveView, be prepared to get comfortable with frequently upgrading as things change at a cracking pace.<br />
The updates since last month that I've been most interested in are:

---
[.header: alignment(left)]

# [fit] **LiveView 0.12.1**

## `enableProfiling()` and `disableProfiling()` to LiveSocket

^
enableProfiling() and disableProfiling() to LiveSocket for client performance profiling to aid the development process

---
[.header: alignment(left)]

# [fit] **LiveView 0.12.1**

## `enableProfiling()` and `disableProfiling()` to LiveSocket
## Overhaul of the testing module

^
And, an overhaul of the testing module, more closely integrating your LiveView template with your LiveView events

---

<br />
# [fit] **FREE LiveView Course**

## `https://pragmaticstudio.com/phoenix-liveview`

^
If you haven't had the chance to delve into LiveView to see what all the fuss is out, I can highly recommend having a look at Pragmatic Studio's free LiveView course. It's still in development, but they've released 6 videos, including a great intro video that explains, with cool moving diagrams, what LiveView is at a high level and where it's benefits are. They had Jose Valim do technical reviews on the course, so they are legit.

---

<br />
# [fit] **Tips / Tricks**
# [fit] Community News

^

---

# [fit] **Jobs**

^
- Hiring?
- Looking for Work?
- Speak up!

---

# [fit] **Slack**
# [fit] `elixir-slackin.herokuapp.com`
# [fit] `view-source-radboats.herokuapp.com`

---

![inline 7%](https://www.dropbox.com/s/am5fvlc37x3t6jm/Twitter_logo_bird_transparent_png.png?dl=1)

# [fit] `@ElixirSydney`
# [fit] `@ElixirMelbourne`

---

# [fit] Next Meetup
# [fit] **June sometime**
# [fit] *\(should we do this again?\)*

^
The next meetup will be in June sometime. Our combined meetup this month was a bit of an experiment to get all Australian Elixirists in one place while we're all doing meetups online and physical geography isn't relevant.<br />
So, should we do this again, or continue with our region-focused meetups? If you have any feedback, please let us know by reaching out to the meetup organisers.<br />
Thanks for coming along and we hope to see you next month in whatever format these meetups end up taking!
