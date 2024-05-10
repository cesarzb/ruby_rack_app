require 'sqlite3'

SQLite3::Database.new 'data.db' do |db|
  db.execute <<-SQL
      drop table expenditures
  SQL
end
