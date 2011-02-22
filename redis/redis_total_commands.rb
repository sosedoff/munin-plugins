#! /bin/env ruby

require 'rubygems'
require 'redis'

require 'pp'

config = ARGV.any? { |a| a =~ /config/ }

if config
  puts "graph_title Redis Total Commands"
  puts "graph_category other"

  puts "memory.label commands"
else
  redis = Redis.new
  info  = redis.info

  puts "memory.value" + " " + info[:total_commands_processed].to_s
end

