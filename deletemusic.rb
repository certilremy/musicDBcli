require_relative 'config.rb'

class Deletemusic

def drop_all
        sql = "DROP TABLE IF EXISTS students"
        DB[:conn].execute(sql)

end


def dropmizik(name)
    sql = "DELETE FROM mizik WHERE lower(name) = ?;"
    DB[:conn].execute(sql,name.downcase)
    puts "music deleted".yellow

end

def deleteMizik
    puts "here are your music:".upcase.yellow
    GetMusic.all.each {|m|
        m.printMizik
      
    }
    puts "please enter the name of the music you whant to delete"
    name = gets.strip()
    puts "You are about to delete #{name} in your database?".red
    puts "type no to cancel yes to delete."
    answer = gets.strip().downcase
    if answer == "yes"
        d = Deletemusic.new
        d.dropmizik(name)
    else 
        Menucontroller.mainMenu
    end
    

end
    
end