require_relative 'config.rb'

class Search

    def searchname
        puts "Please enter the music name"
        name = gets.strip()
        res = Song.find_by_name(name)
        self.yield_self{
            puts "we found the following results".yellow
            puts "#{res.id} : #{res.name} : #{res.album}"
        } if !res.nil?
        
        end
end