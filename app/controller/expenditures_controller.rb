# frozen_string_literal: true

require_relative './base_controller'
require './app/model/expenditure'

# class for controller handling expenditures
class ExpendituresController < BaseController
  def index
    return authenticate! unless current_user

    @title = 'So many expenditures'
    @expenditures = Expenditure.all
    build_response render_template
  end

  def show
    return authenticate! unless current_user

    @expenditure = Expenditure.find(params[:id])
    if @expenditure
      @title = "#{@expenditure.name}"
      build_response render_template
    else
      not_found
    end
  end

  def new
    return authenticate! unless current_user

    @title = 'More expenditures please'
    build_response render_template
  end

  def create
    return authenticate! unless current_user

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
    return authenticate! unless current_user

    Expenditure.destroy(params[:id])
    build_response '', 204
  end
end
