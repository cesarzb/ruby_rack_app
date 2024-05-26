# frozen_string_literal: true

require_relative './base'

# model class for expenditure
class Expenditure < Base
  attr_accessor :id, :name, :date, :price

  def initialize(args)
    return if args.nil?

    @id = args[0]
    @name = args[1]
    @date = args[2]
    @price = args[3]
  end

  def self.validate(params)
    validate_name(params[0]) && validate_date(params[1]) && validate_price(params[2])
  end

  def self.validate_name(name)
    name =~ /^[^\s]{1,100}$/u
  end

  def self.validate_date(date)
    date =~ /((((19|20)([2468][048]|[13579][26]|0[48])|2000)-02-29|((19|20)[0-9]{2}-(0[469]|11)-(0[1-9]|[12][0-9]|30)|(19|20)[0-9]{2}-(0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01])|(19|20)[0-9]{2}-02-(0[1-9]|1[0-9]|2[0-8])))\s([01][0-9]|2[0-3]):([012345][0-9]):([012345][0-9]))/
    # https://regexlib.com/REDetails.aspx?regexp_id=3790
  end

  def self.validate_price(price)
    price =~ /^\d*\.?\d*$/
  end
end
