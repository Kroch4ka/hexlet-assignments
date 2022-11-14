# frozen_string_literal: true

class SetLocaleMiddleware
  attr_reader :app

  def initialize(app)
    @app = app
  end

  # BEGIN
  def call(env)
    I18n.locale = get_preffered_locale(env['HTTP_ACCEPT_LANGUAGE'])
    res = app.call(env)
  end

  private

  def get_preffered_locale(accept_language_value)
    return I18n.default_locale if accept_language_value.nil? || accept_language_value.empty?

    normalized = accept_language_value.gsub('q=', '').split(',')
                                      .map { |lang| lang.split(';') }

    normalized.each do |normalized_locale|
      locale = normalized_locale[0]
      return locale if I18n.available_locales.include?(locale.to_sym)
    end

    I18n.default_locale
  end
  # END
end
