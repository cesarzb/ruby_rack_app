# frozen_string_literal: true

require_relative './base_controller'
require './app/model/expenditure'

# class for controller handling expenditures
class ExpendituresController < BaseController
  def index
    @title = 'So many expenditures'
    @expenditures = Expenditure.all
    build_response render_template
  end

  def show
    @expenditure = Expenditure.find(params[:id])
    @title = "#{@expenditure.name}'s page"
    build_response render_template
  end

  def new
    @title = 'More expenditures please'
    build_response render_template
  end

  def create
    expenditure = Expenditure.new(name: params['expenditure']['name'])
    expenditure.save
    redirect_to "expenditures/#{expenditure.id}"
  end
end
