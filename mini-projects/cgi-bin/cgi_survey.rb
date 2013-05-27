#!/usr/bin/ruby
require 'cgi'

cgi = CGI.new
print "Content-type: text/html\r\n\r\n"
puts cgi.params
