require_relative 'config.rb'

class Menucontroller

    def self.subMenu
        puts 'what do you want to do else?'.yellow
           puts "- Type 1 to go to the main menu"
           puts "- Type exit to quit the app"
   
   
           choice = gets.strip()
           choice.downcase
       
           case choice
           when "1"
           self.mainMenu
           when "2"
           puts "quitting"
           else 
               puts "this is not a valide choice!"
           end
       end
   #
    

    def self.mainMenu
        puts" Welcome to achiv mizik! Achiv mizik is a CLI app that let you save your fav music to a database.".yellow
        puts" please f0llow these step here to use the app"
        puts "- Type 1 to list all your previous added music"
        puts "- Type 2 to add a new music"
        puts "- Type 3 to delete a music"
        puts "- Type 4 to modify a music"
        puts "- Exit to quit the application"
    
        choice = gets.strip()
        choice.downcase
    
        case choice
        when "1"
            puts "YOU HAVE THE FOLLOWING MUSIC:".yellow
            GetMusic.all.each {|m|
                m.printMizik
              
            }
            self.subMenu
        when "2"
        music = Addmusic.new
        music.addMusic
        self.subMenu
        when "3"
        d = Deletemusic.new
        d.deleteMizik
        self.subMenu
        when "4"
        puts "4"
        when "5"
        puts"5"
        when "exit"
            puts "you're quitting the application"
        else 
            puts "this is not a valide choice!"
        end
    end


   

    
end