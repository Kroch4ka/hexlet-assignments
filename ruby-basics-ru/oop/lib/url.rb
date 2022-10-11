# frozen_string_literal: true

require 'forwardable'
require 'uri'

# BEGIN
class Url
  extend Forwardable
  include Comparable

  def ==(other)
    url.host == other.host &&
      url.scheme == other.scheme &&
      query_params == other.query_params &&
      url.port == other.port
  end

  attr_reader :url

  def_delegators :@url, :host, :scheme, :query, :port

  def initialize(url)
    @url = URI(url)
  end

  def query_params
    return {} if url.query.nil?

    url.query.split('&').each_with_object({}) do |param, accum|
      key, value = param.split('=')
      accum[key.to_sym] = value
    end
  end

  def query_param(key, value = nil)
    query_params[key].nil? ? value : query_params[key]
  end
end
# END
