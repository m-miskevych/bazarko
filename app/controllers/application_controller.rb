class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  around_action :switch_locale

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def default_url_options
    { locale: I18n.locale }
  end



  # before_action :set_locale

  # def set_locale
  #   I18n.locale = params[:locale] || locale_from_header || I18n.default_locale
  # end

  # def locale_from_header
  #   request.env.fetch("HTTP_ACCEPT_LANGUAGE", "").scan(/^[a-z]{2}/).first
  # end

  # def default_url_options
  #   { locale: I18n.locale }
  # end
end
