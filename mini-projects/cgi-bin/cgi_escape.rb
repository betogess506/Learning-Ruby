#!/usr/bin/ruby
require 'cgi'
print "Content-type: text/html\r\n\r\n"
puts CGI.escape("This, is a wonderful/awesome string that needs to be escaped & printed! HURRAH!!!")