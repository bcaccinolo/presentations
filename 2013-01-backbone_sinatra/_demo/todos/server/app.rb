require 'sinatra'
require 'json'
require 'mongoid'

Mongoid.load!("./mongoid.yml")

class Todo
  include Mongoid::Document
  field :title, type: String
  field :order, type: Integer
  field :done , type: Boolean
end

get '/' do
  erb :index
end

post '/todos' do
  content_type :json
  data = JSON.parse request.body.read
  a = Todo.create data
  # returning the id to be saved on the client
  # {id:a.id}.to_json
end

get '/todos' do
  content_type :json
  Todo.all.map{|t| {id:t.id,title:t.title,order:t.order,done:t.done} }.to_json
end

put '/todos/:id' do
  data = JSON.parse request.body.read
  t = Todo.find params["id"]
  t.update_attributes data
  true
end

delete '/todos/:id' do
  t = Todo.find params["id"]
  t.delete
  true
end
