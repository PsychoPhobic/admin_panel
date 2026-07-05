module AdminPanel
  module ApplicationHelper
    include SidebarHelper
    include CrudHelper
    include FlashHelper

    LOCALE_FLAG_CODES = { en: "us", de: "de" }.freeze
    LOCALE_NAMES = {
      en: "English (US)",
      de: "Deutsch"
    }.freeze

    def available_languages
      admin_panel_config.available_locales.map do |locale|
        {
          locale: locale,
          code: locale_flag_code(locale),
          name: LOCALE_NAMES.fetch(locale.to_sym, locale.to_s.upcase),
          url: locale_switch_url(locale)
        }
      end
    end

    def locale_switch_url(locale)
      locale = locale.to_sym

      url_for(request.path_parameters.merge(request.query_parameters).merge(locale: locale))
    rescue ActionController::UrlGenerationError
      admin_dashboard_path(locale: locale)
    end

    def locale_flag_code(locale = I18n.locale)
      LOCALE_FLAG_CODES.fetch(locale.to_sym, locale.to_s)
    end

    def admin_panel_config
      AdminPanel::Engine.config.admin_panel
    end
  end
end
