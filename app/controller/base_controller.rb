# frozen_string_literal: true

require 'pry'
require 'pry-nav'
require 'erb'
require './app/model/user'
require 'bcrypt'

# controller containing methods useful for all controllers
class BaseController
  attr_reader :request
  attr_accessor :session

  def initialize(request, session)
    @request = request
    @session = session
  end

  def index
    build_response render_template
  end

  # authentiaction logic
  def hash_password(password)
    BCrypt::Password.create(password).to_s
  end

  def test_password(password, hash)
    BCrypt::Password.new(hash) == password
  end

  def current_user
    @current_user ||= (User.find(session.fetch(:user_id)) if session.key?(:user_id))
  end

  def authenticate!
    redirect_to '/sessions/new'
  end

  private

  def render_template(name = params[:action])
    templates_dir = self.class.name.downcase.sub('controller', '')
    template_file = File.join(templates_dir, "#{name}.html.erb")

    file_path = template_file_path_for(template_file)

    if File.exist?(file_path)
      puts "Rendering template file #{template_file}"
      render_erb_file(file_path)
    else
      "Error: no available template file #{template_file}"
    end
  end

  def render_partial(template_file)
    file_path = template_file_path_for(template_file)
    if File.exist?(file_path)
      puts "> Rendering partial #{template_file}"
      render_erb_file(file_path)
    else
      "Error: no available template file #{template_file}"
    end
  end

  def template_file_path_for(file_name)
    File.expand_path(File.join('../../views', file_name), __FILE__)
  end

  def render_erb_file(file_path)
    raw = File.read(file_path)
    ERB.new(raw).result(binding)
  end

  def build_response(body, status: 200)
    [status, { 'ContentType' => 'text/html' }, [body]]
  end

  def redirect_to(uri)
    [302, { 'Location' => uri }, []]
  end

  def params
    request.params
  end

  def not_found(msg = 'Page not found')
    [404, { 'Content-Type' => 'text/plain' }, [msg]]
  end
end
