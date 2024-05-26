require 'sqlite3'

class Migration1
  def self.run
    SQLite3::Database.new 'data.db' do |db|
      db.execute <<~SQL
        create table expenditure (
            id integer primary key autoincrement,
            name varchar2(32),
            date datetime,
            price numeric(10, 2)
        )
      SQL
    end
  end
end
