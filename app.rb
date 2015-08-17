require './lib/to_do.rb'
require 'sinatra/reloader'
require 'sinatra'
also_reload '../lib/**/*.rb'
require 'pg'

DB = PG.connect({:dbname => "to_do"})

get '/' do
  Task.clear
  erb :index
end

post '/' do
  @task = Task.new(params['to_do'])
  @task.save
  erb :index
end
