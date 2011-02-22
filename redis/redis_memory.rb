#! /bin/env ruby

require 'rubygems'
require 'redis'

require 'pp'

config = ARGV.any? { |a| a =~ /config/ }

if config
  puts "graph_title Redis Memory"
  puts "graph_category other"

  puts "memory.label memory"
else
  redis = Redis.new
  info  = redis.info

  puts "memory.value" + " " + info[:used_memory].to_s
end

