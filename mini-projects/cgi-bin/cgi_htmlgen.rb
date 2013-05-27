#!/home/richard/.rvm/rubies/ruby-2.0.0-p195/bin/ruby
require 'cgi'
#print "Content-type: text/html\r\n\r\n"
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
