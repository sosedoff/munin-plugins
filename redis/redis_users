#! /bin/env ruby

require 'rubygems'
require 'redis'

require 'pp'

config = ARGV.any? { |a| a =~ /config/ }

if config
  puts "graph_title Redis Connections"
  puts "graph_category other"

  puts "memory.label Connections"
else
  redis = Redis.new
  info  = redis.info

  puts "memory.value" + " " + (info[:connected_clients].to_i - 1).to_s
end

