# Better APIs with GraphQL
## Josh Price
### github.com/joshprice
### @joshprice

---
# Cargo Cult

![](cargo-cult1.jpg)

^ describe what a cargo cult is
^ history and images of Tanna, Vanuatu
^ Magical Thinking

---
> Any sufficiently advanced technology is indistinguishable from magic
-- Arthur C. Clarke's Third Law

---
> The only way of discovering the limits of the possible is to venture a little way past them into the impossible
-- Clarke's Second Law

---
# Typical REST API

![](rest-api.png)

---
# [Fit] Internal APIs
# [Fit] tightly coupled
# [Fit] to clients

---
# Tips

- Don't use for external accessible APIs (yet)

---
# REST is great

* Simple
* Well-understood
* APIs work like the web does
* Lots of tooling
* Designed for **very** loose coupling

^ * External APIs it's a different story, REST works well for that

^* URL based (easy to develop against/debug)
^* ? Readable data representation (JSON vs XML)
^* ? Resource oriented and easy to model

---
# REST is *hard* in practice

* Big upfront design required
* Hard to get right
* Hard to change (versioning problems)
* Maintainability issues
* No one true way to do REST (Swagger)
* Over/underfetching
* Can solve these issues but its awkward

^ Need to anticipate all current and future clients and their needs
^ Badly designed APIs can significantly hamper the design of great frontends

---
# What is GraphQL?

* Language for defining types & queries
* Developed by Facebook
* Used internally since 2012
* Open source version published in July 2015
* Relay released in August 2015
* Specification: https://facebook.github.io/graphql

---
# GraphQL Highlights

* It's a *specification* for client/server interaction
* Language independent
* Assumes nothing about:
  - transport
  - message protocol
  - data store

---
![fit](graphql-api.png)

---
# Exhibit A: REST API

Fetch user name and friends names

`GET /users/1`
`GET /users/1/friends`

or

`GET /users/1/friends?include=user.name,friend.name`

^ This is what GraphQL provides for you is a standard way of doing this

---
# Exhibit B: GraphQL API

```
{                                     "data": {
  user(id: 1) {                         "user": {
    name                                  "name": "Josh",
    friends {                             "friends": [{
      name                                  "name": "James"
    }                                     }]  
  }                                     }  
}                                     }
```

---
# [fit] Key
# [fit] features

---
# [fit] Strongly
# [fit] typed

---
# [fit] Single
# [fit] endpoint

---
# [fit] Single
# [fit] query

---
# [fit] Self
# [fit] documenting

---
# [fit] Performance

^ * Major bandwidth/latency reduction from overfetching and N+1 HTTP roundtrips

---

# [fit] Ecosystem
# [fit] Evolving
# [fit] Quickly

---
# Many Server Implementations

- Javascript (reference)
- Ruby/Python/PHP
- Java, Sangria (Scala), 
- .NET
- Elixir

---
# Client Frameworks

- Relay (React)
- ApolloStack Client
  + React + Native
  + Angular 2
  + Redux support
- Lokka

---
# Simple Schema

```elixir
type QueryRoot {
  greeting: String
}
```

---
# Simple Query

### Query

```js
{ greeting }
```

### JSON response

```js
{
  "data": {
    "greeting": "Hello, World!"
  }
}
```

---
# Schema with Data Fetching

```elixir
@items %{"a" => %{id: "a", name: "Foo"}, "b" => %{id: "b", name: "Bar"}}

%Schema{
  query: %ObjectType{
    fields: %{
      item: %{
        type: %Item{},
        args: %{id: %{type: %String{}}},
        resolve: fn(_, %{id: id}, _) -> Map.get(@items, id) end
      }
    }
  }
}
```

---
# Query

```js
{
  item(id: "a") {
    id
    name
  }
}
```

---
# JSON Response

```js
{
  "data": {
    "id": "a",
    "name": "Foo"
  }
}
```

---
# Setup GraphQL.Plug

```
forward "/", GraphQL.Plug, schema: {TestSchema, :schema}
```

---
# [fit] GraphiQL
# [fit] Demo

---
# Client Options (pic)

- Relay
- Apollo

---
# Resources

- Awesome GraphQL

---
# GraphQL Elixir

* Community driven Elixir GraphQL implementation
* Ported from JS reference implementation
* Getting close to spec completeness (1.0 coming soon)
* 404 stars (~22nd most popular elixir github repo)
* ~20 contributors
* Me and @freshtonic

---
# Ecosystem

- **graphql** (core)
- **plug_graphql** (mount in Phoenix or Cowboy)
- **Relay** support (TodoMVC example)
- **EctoGraph** (generate GraphQL types from Ecto models)
- **Phoenix** examples
- **RethinkDB** examples

---
# GraphQL CATS

- Compatibility Acceptance Tests
- YAML specs for cross-implementation compatibility

# Demo

---
# Future - GraphQL Spec

* Push: Apps should reflect current state of world
* Subscriptions + Phoenix channels + RethinkDB
* Live queries
* Streaming
* Batch
* Defer 

---
# Arbitrary Queries

- Facebook 

---
# When to use?

- Don't allow arbitrary queries from unknown clients
- Use when you have 

---
# Early Days

- -














---
# Future - GraphQL Elixir

* IDL Schema def
* Resolver middleware
* Swagger/OpenAPI code gen
* Elm type generation
* Better docs 
* More examples

---
# How can you get involved?

* Try it out
* Ask questions
* Pairing (remote or face to face)
* Star the repos
* Report / Triage / Fix a bug
* PRs: tools, website, docs, blog

---
# Resources

* Website
  - http://graphql-elixir.org
* Plug (Hex: plug_graphql)
  - https://github.com/graphql-elixir/plug_graphql
* Examples
  - https://github.com/graphql-elixir/hello_phoenix_graphql


---
# Questions?

---
![](api-gateway.png)

