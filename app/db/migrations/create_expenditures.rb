require 'sqlite3'

SQLite3::Database.new 'data.db' do |db|
  db.execute <<-SQL
    create table expenditures (
        id integer primary key autoincrement,
        name varchar2(32),
        date datetime,
        price numeric(10, 2)
    )
  SQL
end
