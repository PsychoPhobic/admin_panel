module AdminPanel
  class ApplicationController < ::ApplicationController
    include FlashMessages

    layout "admin_panel/application"

    helper AdminPanel::SidebarHelper
    helper AdminPanel::CrudHelper
    helper AdminPanel::AuthHelper
    helper AdminPanel::NavbarHelper
    helper AdminPanel::AuthenticationHelper

    before_action :set_locale

    private

    def set_locale
      locale = params[:locale].presence&.to_sym
      unless locale && admin_panel_config.available_locales.include?(locale)
        locale = admin_panel_config.default_locale
      end

      I18n.locale = locale
    end

    def default_url_options
      { locale: I18n.locale }
    end

    def admin_panel_config
      AdminPanel::Engine.config.admin_panel
    end
  end
end
