require_relative 'config.rb'

class Search

    def searchname
        puts "Please enter the music name"
        name = gets.strip()
        res = Song.find_by_name(name)
        if res.nil?
            puts "No music with name!"
        else
      puts "we found the following results".yellow
      puts "#{res.id} : #{res.name} : #{res.album}"
        end
    end
end