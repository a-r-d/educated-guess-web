# Educated Guess
#  educated guess will generate password lists based 
#  on given known information and prefs.
require 'sinatra'
require 'haml'
require_relative 'logic'

## Haml Options:
#Haml::Options.defaults[:format] = :html5
configure do
  set :name, 'educated-guess'
  set :haml, { :format => :html5 }
end

$wordlist_dir = Dir.pwd + "/wordlist" # (relative)


get '/' do 
    haml :home, :locals => {:wordlists => getWordlist( $wordlist_dir )}
end


post '/' do 
    'hullo post'
end




