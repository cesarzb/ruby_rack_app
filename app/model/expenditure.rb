# frozen_string_literal: true

require_relative './base'

# model class for expenditure
class Expenditure < Base
  attr_accessor :id, :name

  def initialize(id: nil, name: nil)
    @id = id
    @name = name
  end
end
