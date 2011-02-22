#! /bin/env ruby

require 'rubygems'
require 'redis'

require 'pp'

config = ARGV.any? { |a| a =~ /config/ }

if config
  puts "graph_title Redis Total Connections"
  puts "graph_category other"

  puts "memory.label connections"
else
  redis = Redis.new
  info  = redis.info

  puts "memory.value" + " " + info[:total_connections_received].to_s
end

