#! /bin/env ruby

require 'rubygems'
require 'redis'

config = ARGV.any? { |a| a =~ /config/ }

infos = Redis.new.info.inject({}) { |h, (k, v)| h[k] = v if k.to_s =~ /^db\d+/ ;h  }.inject({}) { |hash, (dbnum,out)| out =~ /keys=(\d+),expires=(\d+)/ ;hash.update(dbnum => {:keys => $1.to_i, :expires => $2.to_i} )  }

if config
  puts "graph_title Redis Keys"
  puts "graph_category other"

  infos.each { |db, infos| puts "#{db}_keys.label #{db} keys"; puts "#{db}_expires.label #{db} expires" }
else
  infos.each { |db, infos| puts "#{db}_keys.value #{infos[:keys]}"; puts "#{db}_expires.value #{infos[:expires]}" }
end

