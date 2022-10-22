# frozen_string_literal: true

require 'rack'

class Router
  def call(env)
    # BEGIN
    req = Rack::Request.new env

    case req.path
    when '/' then [200, { 'Content-Type' => 'text/plain' }, ['Root!']]
    when '/about' then [200, { 'Content-Type' => 'text/plain' }, ['About!']]
    else
      [404, { 'Content-Type' => 'text/plain' }, ['Not found!']]
    end
    # END
  end
end
