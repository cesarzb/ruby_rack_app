# frozen_string_literal: true

require_relative './base_controller'
require './app/model/user'
require 'pry'

# class for controller handling users
class UsersController < BaseController
  def new
    @title = 'Create your amazing account'
    build_response render_template
  end

  def create
    attributes = [params['user']['username'],
                  params['user']['password']]
    if User.validate
      user_id = User.save([params['user']['username'], hash_password(params['user']['password'])])
      redirect_to "users/#{user_id}"
    else
      redirect_to 'expenditures'
    end
  end

  def show
    @user = User.find(params[:id])
    if @user
      @title = @user.username
      build_response render_template
    else
      not_found
    end
  end

  def destroy
    not_found
  end

  def index
    not_found
  end
end
