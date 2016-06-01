footer: Sydney Elixir Meetup, May 2016 - © Josh Price

# Phoenix in the Cloud
## Josh Price
### github.com/joshprice
### @joshprice

---
# Cloud Deployment

## For certain values of Cloud

- Heroku
- Cloud Foundry

---
# Heroku

- Free plan
  - 1 web dyno
  - 1 worker dyno
  - PostgreSQL
  - Redis

---
# Heroku

- Super easy deploy
- Easy to get started

- But slow to start the app on free plan
- And expensive to scale up

---
# Getting Started with Heroku

- Git repo with Phoenix app
- Install toolbelt (https://toolbelt.heroku.com/)

---
# Create Heroku app

```bash
$ heroku create --buildpack "https://github.com/HashNuke/heroku-buildpack-elixir.git"

Creating mysterious-meadow-6277... done, stack is cedar-14
Buildpack set. Next release on mysterious-meadow-6277 will use https://github.com/HashNuke/heroku-buildpack-elixir.git.
https://mysterious-meadow-6277.herokuapp.com/ | https://git.heroku.com/mysterious-meadow-6277.git
Git remote heroku added
```

---
# Add static buildpack

```sh
$ heroku buildpacks:add https://github.com/gjaldon/heroku-buildpack-phoenix-static.git

Buildpack added. Next release on mysterious-meadow-6277 will use:
  1. https://github.com/HashNuke/heroku-buildpack-elixir.git
  2. https://github.com/gjaldon/heroku-buildpack-phoenix-static.git
Run `git push heroku master` to create a new release using these buildpacks.
```

---
# Use environment variables

12 factor apps are configured via env vars

- http://12factor.net/


```elixir
System.get_env("MY_SPECIAL_ENV_VAR")
```

---
# `config/prod.exs`

```elixir
config :hello_phoenix, HelloPhoenix.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [host: "example.com", port: 80],
  cache_static_manifest: "priv/static/manifest.json",

  # retrieve environment variable
  secret_key_base: System.get_env("SECRET_KEY_BASE")
```

---
# `config/prod.exs`

```elixir
# Configure your database
config :hello_phoenix, HelloPhoenix.Repo,
  adapter: Ecto.Adapters.Postgres,

    # retrieve environment variable
  url: System.get_env("DATABASE_URL"),

  pool_size: 20,
  ssl: true
```

---
# `config/prod.exs`

Replace:

```elixir
url: [host: "example.com", port: 80],
```

with:

```elixir
url: [scheme: "https", host: "mysterious-meadow-6277.herokuapp.com", port: 443],
force_ssl: [rewrite_on: [:x_forwarded_proto]],
```

---
# Other things to remember

- Reduce websocket timeout below herokus 55s limit
- Add DB:

```
heroku addons:create heroku-postgresql:hobby-dev
```

---
# Set secret key base env var

```sh
$ mix phoenix.gen.secret

xvafzY4y01jYuzLm3ecJqo008dVnU3CN4f+MamNd1Zue4pXvfvUjbiXT8akaIF53
```

```sh
$ heroku config:set SECRET_KEY_BASE="xvafzY4y01jYuzLm3ecJqo008dVnU3CN4f+MamNd1Zue4pXvfvUjbiXT8akaIF53"

Setting config vars and restarting mysterious-meadow-6277... done, v3
SECRET_KEY_BASE: xvafzY4y01jYuzLm3ecJqo008dVnU3CN4f+MamNd1Zue4pXvfvUjbiXT8akaIF53
```

---
# Deploy!

```sh
$ git push heroku master

Counting objects: 55, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (49/49), done.
Writing objects: 100% (55/55), 48.48 KiB | 0 bytes/s, done.
Total 55 (delta 1), reused 0 (delta 0)
remote: Compressing source files... done.
remote: Building source:
remote:
remote: -----> Multipack app detected
remote: -----> Fetching custom git buildpack... done
remote: -----> elixir app detected
remote: -----> Checking Erlang and Elixir versions
...
```

---
# CloudFoundry Deployment

- Uses similar buildpacks
- Deploy with CF CLI
- https://github.com/DylanGriffith/cloudfoundry-phoenix

---
# Quick start

```sh
$ cf push APPNAME -b https://github.com/joshprice/cloudfoundry-buildpack-elixir
```

- uses default config of buildpack
- uses default start command ie. `mix phoenix.server`
- uses default for instances and mem/disk

---
# Add a manifest file

```
---
instances: 1
memory: 128M
disk_quota: 512M
buildpack: https://github.com/joshprice/cloudfoundry-buildpack-elixir
command: mix phoenix.server
```

---
# `elixir_buildpack.config`

```
erlang_version=18.2.1
elixir_version=1.2.4
always_rebuild=false
```

- My buildpack has the latest as the default

---
# Don't upload everything

- Add a `.cfignore` file

```sh
$ cp .gitignore .cfignore
```

- Protip: don't upload `node_modules`

---
# Buildpack internals tour

> Oh my goodness it's full of shell scripts!

---
# Resources

* http://www.phoenixframework.org/docs/heroku
* https://github.com/DylanGriffith/cloudfoundry-phoenix
* https://github.com/HashNuke/heroku-buildpack-elixir
* https://github.com/gjaldon/heroku-buildpack-phoenix-static
* https://github.com/gogolok/cloudfoundry-buildpack-elixir
* https://github.com/joshprice/cloudfoundry-buildpack-elixir

---
# Questions?
