#!/usr/bin/env ruby
# ------------------------------------------------------------------------------
# Resque plugin for Munin
# ------------------------------------------------------------------------------
require 'rubygems'
require 'resque'

HOST = ENV['host'] ? ENV['host'] : '127.0.0.1'
PORT = ENV['port'] ? ENV['port'] : '6379'

Resque.redis = "#{HOST}:#{PORT}"

queues = {}

Resque.queues.each do |queue|
  queues[queue] = Resque.size(queue)
end

if ARGV.any? && ARGV[0] == 'config'
  puts 'graph_title Queues'
  puts 'graph_vlabel Enqueued Jobs'
  puts 'graph_category resque'

  queues.keys.each do |queue|
    puts "#{queue}.label #{queue}"
  end
  exit 0
end

queues.each do |queue, depth|
  puts "#{queue}.value #{depth}"
end
