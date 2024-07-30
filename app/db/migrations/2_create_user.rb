require 'sqlite3'

class Migration2
  def self.run
    SQLite3::Database.new 'data.db' do |db|
      db.execute <<~SQL
        create table user (
            id integer primary key autoincrement,
            username varchar2(32),
            password_digest nvarchar(72)
        )
      SQL
    end
  end
end

Migration2.run