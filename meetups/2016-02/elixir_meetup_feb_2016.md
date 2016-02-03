
# Welcome to
# Sydney Elixir
## February 2016
---
* **What's been happening?**
* **Intro to GraphQL** (Josh Price)
* **Gen Server** (Martin Stannard)
* **Gen FSM** (Garrett Heinlein)
* **Hangout** (Dinner/drinks @ ???)

---
# Elixir v1.3
## What is coming?

---
# Interesting Libraries

* benchfella - useful for microbenchmarking and comparing between runs
* ex_prof - thin wrapper around erlang profiler
* hexate - converts numbers to hexadecimal
* guardian - authentication (hassox) using JWT and Plug (like warden)
* ueberauth - has lots oauth integrations (facebook, twitter, google, etc)
* corsica - cors plug for Cross origin handling
* maru - clone of Grape for (REST) API building built on plug with versioning
* sugar - RAW!

---
# Interesting Things

* `with` syntax is super sweet! (but what is it useful for?)
  - short circuit failure
  - can wrap transactions around biz logic
  - like Either monad
  - Railway programming
  - like the idea pipes or ex_monad libs
  - implemented as a special form
  - gets rid of boilerplate
  - super elegant programming thing

---
# Tips and Tricks

* Rule #1: Always Use String-Keyed Maps for External Data
  - atoms are never GC'd and can be used to execute DoS

* "Ahh the old XML namespace bomb" - violence

---
# Tips and Tricks

* Macros are easier than you think (but also tricky)
  - check out the programming Elixir book and Metaprogramming Elixir book

* Check out http://theerlangelist.com/article/macros_1

---
# Testing

* Testing is easier than you think
  - because functions!
  - no mocking required (yay)

* Fake your datastore (ie set/get on redis)
* Set it up in the app config

See http://blog.plataformatec.com.br/2015/10/mocks-and-explicit-contracts/

---
# Phoenix performance

* Channels 2 million connections
* WhatsApp now serves 1 billion

---
# New Venue

Thanks Booodl for venue and food and drinks!

Still lots of interest this month (~20 attendees!!)

Forgot to announce the meetup and it wasn't in the radar last week :(

---
# Website/Talks/etc

* I started building a repo to hold all talks

* I'll push it up
  - let's make some kind of github pages homepage

---
# Jobs!

## Looking / Hiring?

* Blake
  - looking for devs to build Elixir APIs early this year
* Pivotal Labs
  - ALWAYS hiring! (finders fee zomg)
