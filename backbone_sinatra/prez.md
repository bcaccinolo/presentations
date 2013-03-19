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
= slide data-x=3000 data-y=-1000 data-rotate-z=-90

![text](images/backbone.png)

Uber-light framework that allows you to structure your Javascript code
in an MVC way

(Model, ControllerView, Collection)

---
= slide data-x=3000 data-y=-2000 data-rotate-z=-90

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
= slide data-x=3000 data-y=-3000 data-rotate-z=-90

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
= slide data-x=3000 data-y=-4000 data-rotate-z=-90

## Backbone Views
### 2 types:
 * Managing rendering of model items
 * Managing the whole application interface

---
= slide data-x=3000 data-y=-5000 data-rotate-z=-90

## Managing rendering of model items

```ruby
var TodoView = Backbone.View.extend({
tagName:  "li",
template: _.template($('#item-template').html()),
events: {
 "click .toggle"   : "toggleDone",
 "dblclick .view"  : "edit",
},
initialize: function() {
 this.listenTo(this.model,'change',this.render);
 this.listenTo(this.model,'destroy',this.remove);
},
render: function() {
 this.$el.html(this.template(this.model.toJSON()));
 return this;
}}
```

---
= slide data-x=3000 data-y=-6000 data-rotate-z=-90

## Managing the whole application

```ruby
var AppView = Backbone.View.extend({
 el: $("#todoapp"),
 events: { ... },
 initialize: function() {
  this.input = this.$("#new-todo");
  this.listenTo(Todos, 'add', this.addOne);
  this.main = $('#main');
  Todos.fetch();
 },
 render: function() {
  var done = Todos.done().length;
  var remaining = Todos.remaining().length;
 }
}
```

---
= slide data-x=0 data-y=1500

# ![text](images/sinatra.png) Sinatra

Domain Specific Language (DSL) for quickly creating web-applications in Ruby

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

