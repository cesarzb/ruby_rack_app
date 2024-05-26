# frozen_string_literal: true

require 'pry'
require 'sqlite3'

# class responsible for executing queries against database
class Operation
  def self.create(table, values)
    placeholders_start = values.length.positive? ? ', ' : ''
    placeholders = "#{placeholders_start}#{Array.new(values.length, '?').join(', ')}"

    query =  <<~SQL
      insert into #{table}
      values (null#{placeholders})
    SQL
    db.query(query, values)

    db.last_insert_row_id
  end

  def self.update(table, columns, values, id)
    placeholders = Array.new(columns.length, '?').join(', ')

    query = <<~SQL
      insert into #{table} (#{placeholders})
      values (#{placeholders})
      where #{table}.id = ?
    SQL
    db.query(query, [*columns, *values, id])
  end

  def self.find(table, id)
    query = <<~SQL
      select * from #{table}
      where id = ?
    SQL
    db.execute(query, [id])
  end

  def self.all(table)
    db.execute <<~SQL
      select * from #{table}
    SQL
  end

  def self.delete(table, id)
    query = <<~SQL
      delete from #{table}
      where #{table}.id = ?
    SQL
    db.query(query, [id])
  end

  def self.db
    @db ||= SQLite3::Database.new 'data.db'
  end
end
