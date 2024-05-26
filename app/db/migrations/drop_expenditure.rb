require 'sqlite3'

class Migration1
  def self.run
    SQLite3::Database.new 'data.db' do |db|
      db.execute <<~SQL
        drop table expenditure
      SQL
    end
  end
end
