# Educated Guess
#  educated guess will generate password lists based 
#  on given known information and prefs.

require 'sinatra'
require 'haml'

## Haml Options:
#Haml::Options.defaults[:format] = :html5
configure do
  set :name, 'educated-guess'
  set :haml, { :format => :html5 }
end

get '/' do 
    haml :home, :locals => {:wordlists => [{:name=> "test"}, {:name=> "test2"}]}
end

post '/' do 
    'hullo post'
end

 


