require 'sinatra'
require 'json'
require './feed.rb'

get '/' do
  sources = JSON.load(File.open("./sources.json"))
  @feeds = Feed.new.fetch(sources)
  erb :index
end