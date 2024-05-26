# frozen_string_literal: true

require_relative './base_controller'
require './app/model/expenditure'
require 'pry'

# class for controller handling expenditures
class ExpendituresController < BaseController
  def index
    @title = 'So many expenditures'
    @expenditures = Expenditure.all
    build_response render_template
  end

  def show
    @expenditure = Expenditure.find(params[:id])
    if @expenditure
      @title = "#{@expenditure.name}"
      build_response render_template
    else
      not_found
    end
  end

  def new
    @title = 'More expenditures please'
    build_response render_template
  end

  def create
    attributes = [params['expenditure']['name'],
                  "#{params['expenditure']['date'].gsub('T', ' ')}:00",
                  params['expenditure']['price']]
    if Expenditure.validate(attributes)
      expenditure_id = Expenditure.save(attributes)
      redirect_to "expenditures/#{expenditure_id}"
    else
      redirect_to 'expenditures'
    end
  end

  def destroy
    Expenditure.destroy(params[:id])
    build_response '', 204
  end
end
