# frozen_string_literal: true

require 'sqlite3'

# class responsible for executing queries against database
class Operation
  def self.create(table, values)
    db.execute <<~SQL
      insert into #{table}
      values (null, #{values.join(', ')})
    SQL
  end

  def self.update(table, columns, values, id)
    db.execute <<~SQL
      insert into #{table} (#{columns.join(', ')})
      values (#{values.join(', ')})
      where #{table}.id = #{id}
    SQL
  end

  def self.find(table, id)
    db.execute <<~SQL
      select * from #{table}
      where #{table}.id = #{id}
    SQL
  end

  def self.db
    @db ||= SQLite3::Database.new 'data.db'
  end
end
