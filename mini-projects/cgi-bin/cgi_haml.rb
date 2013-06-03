#!/usr/bin/ruby
require 'haml'
#print "HTTP/1.0 200 OK\r\n"
print "Content-type: text/html\r\n\r\n"
#I'm editing text in the command prompt!
engine = Haml::Engine.new(%{
%body
  #welcome-box
    %p= greeting
  %p
    As of
    = Time.now
    the reasons you gave were:
  %table
    %tr
      %th Reason 
      %th Rank
    - for reason in reasons
      %tr
        %td= reason[:reason_name]
        %td= reason[:rank]
})

data = {
  :greeting => 'Hello, Dave Thomas',
  :reasons => [
    {:reason_name => 'flexible',    :rank => '87'},
    {:reason_name => 'transparent', :rank => '76'},
    {:reason_name => 'fun',         :rank => '94'}]
}
puts engine.render(nil, data)
