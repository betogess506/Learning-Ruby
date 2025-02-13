require 'builder'

xml = Builder::XmlMarkup.new(target: STDOUT, indent: 2)

xml.person(type: 'programmer') do
  xml.name do
    xml.first 'Richard'
    xml.last 'Wilson'
  end
  xml.location 'Texas'
  xml.preference 'Ruby'
end