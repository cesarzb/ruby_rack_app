require 'sqlite3'

class Migration0
  def self.run
    SQLite3::Database.new 'data.db'
  end
end
