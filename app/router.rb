# frozen_string_literal: true

# class responsible for routing to the correct method
require 'pry'
require 'pry-nav'
class Router
  def initialize(request)
    @request = request
  end

  def route!(session)
    if (klass = controller_class)
      add_route_info_to_request_params!

      controller = klass.new(@request, session)
      action = @route_info[:action]

      if controller.respond_to?(action)
        puts "\nRouting to #{klass}##{action}"
        return controller.public_send(action)
      end
    end
    not_found
  end

  def route_info
    @route_info ||= begin
      resource = path_fragments[0] || 'base'
      id, action = find_id_and_action(path_fragments[1])
      { resource: resource, action: action, id: id }
    end
  end

  def find_id_and_action(fragment)
    case fragment
    when 'new'
      [nil, :new]
    when nil
      action = @request.get? ? :index : :create
      [nil, action]
    else
      action = @request.get? ? :show : :destroy
      [fragment, action]
    end
  end

  def controller_name
    "#{route_info[:resource].capitalize}Controller"
  end

  def controller_class
    Object.const_get(controller_name)
  rescue NameError
    nil
  end

  private

  def not_found(msg = 'Page not found')
    [404, { 'Content-Type' => 'text/plain' }, [msg]]
  end

  def path_fragments
    @path_fragments ||= @request.path.split('/').reject(&:empty?)
  end

  def add_route_info_to_request_params!
    @request.params.merge!(route_info)
  end
end
