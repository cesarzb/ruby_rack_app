require 'sqlite3'

class Migration2_2
  def self.run
    SQLite3::Database.new 'data.db' do |db|
      db.execute <<~SQL
        drop table user
      SQL
    end
  end
end

Migration2_2.run