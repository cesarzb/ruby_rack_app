# frozen_string_literal: true

require_relative './base_controller'
require './app/model/user'

# class for controller handling users
class SessionsController < BaseController
  def new
    @title = 'Log in'
    build_response render_template
  end

  def create
    user = User.find_by(username: params['user']['username']).first
    if user && test_password(params['user']['password'], user.password_digest)
      session.clear
      session.store(:user_id, user.id)
      redirect_to '/'
    else
      @error = 'Username or password incorrect'
      redirect_to '/sessions/new'
      # build_response render_template :new
    end
  end

  def destroy
    session.clear
    redirect_to '/sessions/new'
  end

  def show
    not_found
  end

  def index
    not_found
  end
end
