require_relative 'config.rb'

class Addmusic

    def addMusic
        puts "please enter the name of the music"
        name = gets.strip()
        puts "please enter the album title"
        album = gets.strip()
        puts "You entered the following information".yellow
        puts "#{name}  and #{album} !"
        puts "Do you want to modify theme before save?"
    
        puts "type yes or no"
        confirm = gets.strip()
        confirm.downcase
        if confirm =="yes"
            Song.create(name: name, album: album)
        elsif  confirm =="no"
        puts "please enter the modifyed  name of the music if no Enter the same"
        name = gets.strip()
        puts "please enter the album title if no enter the same"
        album = gets.strip()
        puts "You entered the following information".yellow
        puts "#{name}  and #{album} !"
        Song.create(name: name, album: album)
        end
    end
end