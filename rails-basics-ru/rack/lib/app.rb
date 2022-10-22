# frozen_string_literal: true

require 'rack'
require_relative 'app/admin_policy'
require_relative 'app/execution_timer'
require_relative 'app/signature'
require_relative 'app/router'

module App
  def self.init
    handler = Rack::Handler::Thin
    app = Rack::Builder.new do |builder|
      builder.use AdminPolicy
      # BEGIN
      builder.use ExecutionTimer
      # END
      builder.use Signature

      builder.run Router.new
    end
    handler.run app
  end
end

App.init
