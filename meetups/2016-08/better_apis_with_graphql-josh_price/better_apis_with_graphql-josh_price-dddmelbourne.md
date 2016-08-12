# [Fit] Better APIs
# [Fit] with GraphQL
## Josh Price
### github.com/joshprice
### @joshprice

^ It's great to be here. It's my first time at a DDD conference

^ Thanks for voting for my talk

^ I'm flattered!

---
# Agenda

- Understand GraphQL and why you'd use it
- Build a simple schema
- Run queries against the schema
- Understand important GraphQL concepts
- Summarise client options (Relay, Apollo)
- Gaze into the crystal ball

---
# Experience: Building GraphQL Elixir

- Mainly as a way to learn Elixir and GraphQL
- First major open source project
- I've learned a lot
- Lot's left to learn
- Implementing a GraphQL server is hard

^ Bit of background in case you're wondering "what does this guy know about GraphQL?"

^ Community driven Elixir GraphQL implementation

^ 404 stars (~22nd most popular elixir github repo) ~20 contributors

---
# REST APIs

![](rest-api.png)

^ We've probably all used a RESTful API
^ Most of us have built at least one

---
# [Fit] REST is great

^ Simple
^ (Mostly) well understood
^ APIs work like the web does
^ Lots of tooling
^ Designed for **very** loose coupling
^ URL based (easy to develop against/debug)

---
# Cargo Cult?

![](cargo-cult1.jpg)

^ Describe what a cargo cult is
^ Cargo Cults still practice today in Tanna, Vanuatu
^ REST is a given
^ We use REST without thinking about it

---
# [Fit] REST is *hard*

^ Big upfront design required
^ Hard to model certain domains
^ Hard to change (versioning problems)
^ Maintainability issues
^ No one true way to do REST (Swagger/OpenAPI)

---
# Common Problems

## Overfetching 
## Underfetching

^ Need to anticipate all current and future clients and their needs
^ Badly designed APIs can significantly hamper the design of great frontends

---
# [Fit] Internal APIs
# [Fit] tightly coupled
# [Fit] to clients

^ REST works well for loosely couple external APIs
^ Tightly coupled internal APIs can be better

---
# GraphQL 

![](graphql-api.png)

---
# What is GraphQL?

* Language for defining types & queries
* Developed by Facebook in 2012
* Used to improve mobile app performance
* Serves **300 billion** requests per day

---
# Open Source

* Open sourced in **July 2015**
* Specification  **facebook.github.io/graphql**
* Reference Implementation **github.com/graphql/graphql-js**
* Relay released in **August 2015**

---
# GraphQL Server Implementations

- JavaScript reference
- Ruby / Python / PHP
- Java / Scala (Sangria)
- .NET
- Elixir / Go / Haskell

---
# GraphQL Highlights

* It's a *specification* for client/server interaction
* Language independent
* Assumes nothing about:
  - transport
  - message protocol
  - data store

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
    friends(first: 1) {                     "friends": [{
      name                                  "name": "James"
    }                                     }]  
  }                                     }  
}                                     }
```

---
# Mental
# Model

^ Easy to write and reason about queries

^ Same shape as resulting data

---
# Strongly
# typed

^ code generation possibilities

^ validation of queries 

^ guarantee correct results

^ possibility for great tooling

---
# Single
# Endpoint 

^ Simpler, no URLs

---
# Single
# Query

---
# Unambiguous
# Queries

^ Queries must define all data requested ie every field

---
# Consumer
# Driven
# Contracts

^ APIs understand client usage through queries

^ Easier to evolve a service without versioning

---
# Less
# Versioning 

^ Problem with REST APIs is adding fields. Field additions bloat all existing clients

^ Versioning is required in REST 

^ Facebook still has 4 year old clients which work on the same version

---
# Self
# Documenting

^ Just add descriptions to types and fields

^ Deprecation and reason supported

---
# Performance

^ Major bandwidth/latency reduction from overfetching and N+1 HTTP roundtrips

---
# Schema

```js
type Query {
  me: User
  user(id: Int): User
}

type User {
  name: String
  profilePicture(size: Int = 50): ProfilePicture
  friends(first: Int, orderBy: FriendOrder): [User]
  events(first: Int): [Event]
}

enum FriendOrder { FIRST_NAME, LAST_NAME, IMPORTANCE }
```

---
# Schema (continued)

```js
type ProfilePicture {
  width: Int
  height: Int
  url: String
}

type Event {
  name: String
  attendees(first: Int): [User]
}
```

---
# Simple Query

```json
{                                                                
  me {                                                                
    name                                                                
  }                                                                
}                                                                
```


```json
{
  "data": {
    "name": "Josh Price"
  }
}
```

---
# Schema with Resolver functions

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
# Setup GraphQL Express

```js
import { Schema } from './schema.js';
import graphqlHTTP from 'express-graphql';
import express from 'express';

const app = express();

app.get('/', function(req, res) {
  res.redirect('/graphql');
});

app.use('/graphql', graphqlHTTP({ schema: Schema, graphiql: true }));

app.listen(3000);
```

---
# GraphiQL

---

# GraphQL Ecosystem
# Evolving Quickly

---
# Client Frameworks

- Relay (React)
- ApolloStack Client
  + React + Native
  + Angular 2
  + Redux support
- Lokka

---
# GraphQL CATS

- Compatibility Acceptance Tests
- YAML specs for cross-implementation compatibility
- Makes it easier to implement spec correctly

---
# Gotchas

- Arbitrary Queries
  - Could be slow if deeply nested
  - Complexity analysis
  - Query depth
- Batching at resolver

---
# When to use?

- Use for internal APIs
- Improve mobile (and desktop performance)
- Use when you have 

---
# Early Days

- Don't allow arbitrary queries from unknown clients


---
# GraphQL Backend as a Service

- reindex.io
- graph.cool
- scaphold.io

---
# Future - GraphQL Spec

* Push: Apps should reflect current state of world
* Subscriptions + Phoenix channels + RethinkDB
* Defer 
* Stream
* Live queries

---
# Resources

* Website http://graphql.org
* Resources
  - github.com/graphql/graphql-js
  - github.com/graphql/express-graphql


---
# Questions?

---
![](api-gateway.png)

