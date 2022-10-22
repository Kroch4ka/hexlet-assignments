# frozen_string_literal: true

class AdminPolicy
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    req = Rack::Request.new(env)
    case req.path
    when '/admin' then [403, { 'Content-Type': 'text/plain' }, []]
    else
      @app.call(env)
    end
    # END
  end
end
