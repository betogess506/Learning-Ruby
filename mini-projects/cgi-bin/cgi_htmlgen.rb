#!usr/bin/ruby
require 'cgi'
#print "Content-type: text/html\r\n\r\n" << Not needed with cgi.out?
cgi = CGI.new('html3')
cgi.out do
  cgi.html do
    cgi.head do
      "\n" + cgi.title {"This is a test"}
    end
    + cgi.body do "\n" +
      cgi.form do "\n" +
        cgi.hr +
        cgi.h1 { "A form: " } + "\n" +
        cgi.textarea("get_text") + "\n" +
        cgi.br +
        cgi.submit
      end
    end
  end
end
