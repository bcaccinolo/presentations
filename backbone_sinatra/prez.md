# Backbone
# &
# Sinatra
## By Benoit Caccinolo

---
= slide data-x=-1000 data-y=-500

![text](images/gravatar.jpeg)

http://bcaccinolo.github.com

Rails developer

Technical Lead @ Billetto

---
= slide data-x=0 data-y=-1500

## The Challenge

Interface the Backbone todo-list

with Sinatra and MondoDB

---
= slide data-x=0 data-y=-1500

## What is Backbone?

---
= slide data-x=1000 data-y=-1500

## Backbone Models

---
= slide data-x=2000 data-y=-1500

## Backbone Collections

---
= slide data-x=3000 data-y=-1500

## Backbone Views

---
= slide data-x=0 data-y=1000

## What is Sinatra?

---
= slide data-x=1000 data-y=1000

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
= slide data-x=1000 data-y=-1000

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
= slide data-x=2000 data-y=1000

## Problems encountered

* Events
* What to return from Sinatra

---
= slide data-x=3000 data-y=1000

## Tak for det ! :)

