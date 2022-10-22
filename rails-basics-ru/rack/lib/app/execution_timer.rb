# frozen_string_literal: true

require 'rake'

class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    from = Time.new
    status, header, body = @app.call env
    message = "Execute time is : #{Time.new - from}"

    [status, header, (body << message).join(' ')]
  end
end
