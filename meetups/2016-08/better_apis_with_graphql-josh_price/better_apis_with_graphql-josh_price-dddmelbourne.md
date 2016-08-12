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
# Experience: GraphQL Elixir

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

^ We've probably all used a RESTful API before

^ Most of us have built at least one

---
# [Fit] REST is great

^ Simple,  (Mostly) well understood

^ APIs work like the web does

^ Lots of tooling

^ Designed for **very** loose coupling

^ URL based (easy to develop against/debug)

---
# [Fit] REST is *hard*

^ Big upfront design required

^ Hard to model certain domains

^ Hard to change (versioning problems)

^ Maintainability issues

^ No one true way to do REST (Swagger/OpenAPI)

---
# Cargo Cult?

![](cargo-cult1.jpg)

^ Describe what a cargo cult is

^ Cargo Cults still practice today in Tanna, Vanuatu

^ REST is a sensible default but we use REST without thinking about it

---
# Common Problems

## Overfetching 
## Underfetching

^ Need to anticipate all current and future clients and their needs
^ Badly designed APIs can significantly hamper the design of great frontends

---
# Internal APIs
# are tightly coupled
# to their clients

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
* Serves **300 billion+** requests per day

---
# Open Source

* Open sourced in **July 2015**
* Specification
  - **facebook.github.io/graphql**
* Reference Implementation
  - **github.com/graphql/graphql-js**
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

^ code generation, ide tooling

^ validation of queries 

^ guarantee correct results

^ possibility for great tooling, flow/elm types

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

```js
{                                                                
  me {                                                                
    name                                                                
  }                                                                
}                                                                
```


```js
{
  "data": {
    "name": "Josh Price"
  }
}
```

---
# User Type

```js
type User {
  name: String
  profilePicture(size: Int = 50): ProfilePicture
  friends(first: Int, orderBy: FriendOrder): [User]
}
```

---
# Schema with Resolver functions

```js
new GraphQLObject({
  type: "User",
  fields: {
    name(user) {
      return user.name
    },
    profilePicture(user, {size}) {
      return getProfilePicForUser(user, size);
    },
    friends(user) {
      return user.friendIDs.map(id => getUser(id));
    }
  }
});
```

---
# Connecting GraphQL to the View

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
# Mutations write data

```js
mutation {
  acceptFriendRequest(userId: 345124) {
    user {
      friends { count }
    }
  }
}
```

```js
mutation {
  rsvpToEvent(eventId: 134624, status: ATTENDING) {
    event {
      invitees { count }
      attendees { count }
    }
  }
}
```

^ Mutations call a function and return data that may have changed

---
# CQRS

- Reads and writes are separate
- Naturally supports Command / Query split
- Separate code paths if you need it

---
# Queries with Fragments

```js
query {
  event(id: 123) {
    ...attendeeList
  }
}

fragment profilePic on User {
  profilePicture { width, height, url }
}

fragment personRow on User {
  ...profilePic
  name
}

fragment attendeeList on Event {
  attendees {
    ...personRow
  }
}
```

---
# View Components

```js
fragment profilePic on User {
  profilePicture {
    width
    height
    url
  }
}
```

```js
function ProfilePic(props) {
  const pic = props.data.profilePic
  return <img width={pic.width} height={pic.height} src={pic.url} />
}
```

---
# Component Hierarchy

```js
fragment personRow on User {
  ...profilePic
  name
}
```

```js
function PersonRow(props) {
  const data = props.data
  return (
    <div>
      <ProfilePic data={data} />
      <span>{data.name}</span>
    </div>
  );
}
```

---
# Relay (TL;DR)

- Each view component declares query
- Relay batches current render tree 
- Sends single query
- Handles caching using global IDs
- Relies on schema conventions for metadata

---
# Client-Side Alternatives

- ApolloStack Client
  + React + Native
  + Angular 2
  + Redux support
- Lokka
  - Simple

---
# Gotchas

- Arbitrary Queries
  - Could be slow if deeply nested
  - Complexity analysis
  - Query depth
- Batching at resolver
- You can control this internally

---
# When to use?

- Use for internal APIs
- Improve mobile (and desktop performance)
- Buildkite has exposed a small external API
- Be careful exposing this to the world
- Don't allow arbitrary queries from unknown clients

---
# GraphQL Ecosystem
# Evolving Quickly

^ It's been a year and there was a flurry of activity

^ Many exciting tools are appearing and I can barely keep up

---
# GraphQL Backend as a Service

- reindex.io
- graph.cool
- scaphold.io

---
# Future - GraphQL Spec

* Push: Apps should reflect current state of world
* Subscriptions + Reactive Backend + RethinkDB
* Defer 
* Stream
* Live queries
* GraphQL CATS

^ YAML specs for cross-implementation compatibility

^ Makes it easier to implement spec correctly

---
# Resources

* http://graphql.org
* https://github.com/graphql/graphql-js
* https://github.com/graphql/express-graphql
* Steve Luscher **Zero to GraphQL**
* Awesome GraphQL (**chentsulin/awesome-graphql**)

---
# Questions?

