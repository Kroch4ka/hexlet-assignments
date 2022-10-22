# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    secret = 'Hello World!'
    hash = Digest::SHA256.hexdigest secret

    status, headers, body = @app.call(env)

    [status, headers, body << hash]
    # END
  end
end
