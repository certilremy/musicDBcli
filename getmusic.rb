require_relativ 'config.rb'
class GetMusic
    attr_accessor :id, :name, :album
  
    def self.new_from_db(row)
  
            new_mizik = self.new
            new_mizik.id = row[0]
            new_mizik.name =  row[1]
            new_mizik.album = row[2]
            new_mizik
    end

    def self.all
          sql = <<-SQL
            SELECT *
            FROM mizik
          SQL
  
          DB[:conn].execute(sql).map do |row|
            self.new_from_db(row)
        end
    end
  
    def self.find_by_name(name)
      sql = <<-SQL
              SELECT *
              FROM mizik
              WHERE name = ?
              LIMIT 1
            SQL
  
            DB[:conn].execute(sql, name).map do |row|
              self.new_from_db(row)
            end.first
  
    end

    def printMizik
    puts "#{self.id} : #{self.name} : #{self.album}"
    
    end

    

  end
end