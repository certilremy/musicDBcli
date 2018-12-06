require_relative 'config.rb'

class Song

    attr_accessor :name, :album
    attr_reader :id
    
    def initialize (id =nil , name , album)
        @id = id
        @name = name
        @album = album
    end
    
    def self.create_table
        sql = <<-SQL
        CREATE TABLE IF NOT EXISTS mizik (
          id INTEGER PRIMARY KEY,
          name TEXT,
          album TEXT
        )
        SQL
    
        DB[:conn].execute(sql)
    end
    
    def save
        sql = <<-SQL
          INSERT INTO mizik (name, album) 
          VALUES (?, ?)
        SQL
    
        DB[:conn].execute(sql, self.name, self.album)
        @id = DB[:conn].execute("SELECT last_insert_rowid() FROM mizik")[0][0]
        puts "song saved successfully!".yellow
    end
    
    
    def self.create(name:, album:)
        song = Song.new(name, album)
        song.save
        song
    end

    def self.find_by_name(name)
        sql = "SELECT * FROM mizik WHERE lower(name) = ?"
        result = DB[:conn].execute(sql, name)
       if result.size > 0 
        rmi = result[0]
          Song.new(rmi[0], rmi[1], rmi[2])
       else
          nil
       end
      end
    
    end
