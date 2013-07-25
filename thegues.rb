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


$wordlist_dir = Dir.pwd + "/wordlist" # (relative)
$skip_list = [".", ".."]


def nameOK?(fullpath)
	$skip_list.each { |s| 
		if File.basename(fullpath) == s then
			return false
		end
	}
	return true
end


get '/' do 
	wordlist = []
	Dir.foreach($wordlist_dir) { |file| 
		the_path =  $wordlist_dir + "/" + file

		if !nameOK?(the_path) then
			next
		end
		
		wordlist << {
			:name=> File.basename(the_path),
			:size=> (File.size(the_path) / 1000)
		}
	}

    haml :home, :locals => {:wordlists => wordlist}
end


post '/' do 
    'hullo post'
end




