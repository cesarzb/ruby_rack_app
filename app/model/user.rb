# frozen_string_literal: true

require_relative './base'

# model class for user
class User < Base
  attr_accessor :id, :username, :password_digest

  def initialize(args)
    return if args.nil?

    @id = args[0]
    @username = args[1]
    @password_digest = args[2]
  end

  def self.validate
    true
  end
end
