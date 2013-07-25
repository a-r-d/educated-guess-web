# logic for routes.
###############################################

$skip_list = [".", ".."]

##
# wordlists 
#
def nameOK?(fullpath)
    $skip_list.each { |s| 
        if File.basename(fullpath) == s then
            return false
        end
    }
    return true
end

def getWordlist( wordlist_dir )
    wordlist = []
    Dir.foreach(wordlist_dir) { |file| 
        the_path =  wordlist_dir + "/" + file
        if !nameOK?(the_path) then
            next
        end
        wordlist << {
            :name=> File.basename(the_path),
            :size=> (File.size(the_path) / 1000)
        }
    }
    return wordlist
end


###############################################