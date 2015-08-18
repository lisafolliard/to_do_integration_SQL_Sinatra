require './lib/to_do.rb'
require './lib/list.rb'
require 'sinatra/reloader'
require 'sinatra'
also_reload '../lib/**/*.rb'
require 'pg'

DB = PG.connect({:dbname => "to_do_test"})

get '/' do
  @lists = List.all()
  erb :index
end

get '/lists/new' do
  erb(:list_form)
end

post('/') do
  list = params.fetch('list')
  new_list = List.new({:name => list, :id => nil})
  new_list.save()
  erb(:success)
end

get('/lists/:id') do
  @list = List.find(params.fetch("id").to_i())
  # @tasks = Task.all()
  erb(:list)
end
