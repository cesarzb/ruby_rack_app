# frozen_string_literal: true

require 'pry'

require_relative '../db/operations/operation'

# base class specifying database communication interface for models
class Base
  def self.find(id)
    result = Operation.find(name.downcase, id)[0]
    new(result) if result
  end

  def self.find_by(search)
    result = Operation.find_by(name.downcase, search)
    result.map { |record| new(record) }
  end

  def self.all
    Operation.all(name.downcase).map { |record| new(record) }
  end

  def self.save(attributes)
    Operation.create(name.downcase, attributes)
  end

  def self.destroy(id)
    Operation.delete(name.downcase, id)
  end
end
