# Backbone
# &
# Sinatra
## By Benoit Caccinolo

---
= slide data-x=1000 data-y=0

![text](images/gravatar.jpeg)

http://bcaccinolo.github.com

Rails developer

Technical Lead @ Billetto

---
= slide data-x=2000 data-y=0

## The Challenge

Interface

Backbone todo-list

with Sinatra and MondoDB

---
= slide data-x=0 data-y=-1500 data-rotate-z=90

![text](images/backbone.png)

Uber-light framework that allows you to structure your Javascript code
in an MVC way

(Model, ControllerView)

---
= slide data-x=0 data-y=-500 data-rotate-z=90

## Backbone Models

```ruby
var Todo = Backbone.Model.extend({
 defaults: function() {
   return {
     title: "empty todo...",
     order: Todos.nextOrder(),
     done: false
   };
 },
 initialize: function() {
   if (!this.get("title")) {
     this.set({"title": this.defaults().title});
   }
 }
});
```

---
= slide data-x=0 data-y=500 data-rotate-z=90

## Backbone Collections

```ruby
var TodoList = Backbone.Collection.extend({

  model: Todo,

  url:'/todos',

  nextOrder: function() {
    if (!this.length) return 1;
    return this.last().get('order') + 1;
  },

});
```

---
= slide data-x=0 data-y=1500 data-rotate-z=90

## Backbone Views

---
= slide data-x=0 data-y=1500

## What is Sinatra?

---
= slide data-x=1000 data-y=1500

## Models with Mongoid

```ruby
class Todo
  include Mongoid::Document
  field :title, type: String
  field :order, type: Integer
  field :done , type: Boolean
end
```

---
= slide data-x=2000 data-y=1500

## Simplicity of CRUD requests

```
post '/todos' do
  content_type :json
  data = JSON.parse request.body.read
  a = Todo.new data
  a.save
  # returning the id to be saved on the client
  {id:a.id}.to_json
end
```

---
= slide data-x=2000 data-y=1000

## Problems encountered

* Events
* What to return from Sinatra

---
= slide data-x=2000 data-y=2000

# Demo

---
= slide data-x=3000 data-y=1000

# Tak for det ! :)

