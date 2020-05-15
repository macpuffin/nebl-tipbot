require 'sinatra'
require "sinatra/json"
require 'bitcoin-client'
require './bitcoin_client_extensions.rb'
require './command.rb'
set :bind, '0.0.0.0'

raise "Please set SLACK_API_TOKEN" if ENV['SLACK_API_TOKEN'].nil?

post "/tip" do
  puts params
  raise "NOP" unless params['token'] == ENV['SLACK_API_TOKEN']

  begin
    command = Command.new(params)
    command.perform
    json command.result
  rescue Exception => ex
    json text: "Error: #{ex.message}", icon_emoji: ":large_blue_circle:"
  end
end

get "/" do
  "MacPuffins TipBot Online."
end
