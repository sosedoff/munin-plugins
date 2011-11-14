#! /bin/env ruby

require 'rubygems'
require 'redis'

require 'pp'

config = ARGV.any? { |a| a =~ /config/ }

if config
  puts "graph_title Redis Changes since last save"
  puts "graph_category other"

  puts "memory.label changes"
else
  redis = Redis.new
  info  = redis.info

  puts "memory.value" + " " + info[:changes_since_last_save].to_s
end

