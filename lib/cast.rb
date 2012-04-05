## these env vars are to facilitate testing -- see test/run.rb in the
## cast source
extdir = ENV['CAST_EXTDIR'] || ''
libdir = ENV['CAST_LIBDIR'] || 'cast'

extdir += '/' unless extdir.empty?
libdir += '/' unless libdir.empty?

require "#{extdir}cast_ext"
require "#{libdir}node"
require "#{libdir}node_list"
require "#{libdir}c_nodes"
require "#{libdir}c.tab"
require "#{libdir}parse"
require "#{libdir}to_s"
require "#{libdir}inspect"
