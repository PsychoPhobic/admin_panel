module AdminPanel
  class ApplicationController < ::ApplicationController
    include FlashMessages

    layout "admin_panel/application"

    helper AdminPanel::SidebarHelper
    helper AdminPanel::CrudHelper
    helper AdminPanel::AuthHelper
    helper AdminPanel::AuthenticationHelper
    helper_method :admin_dashboard_path

    before_action :set_locale

    def admin_dashboard_path(**options)
      opts = default_url_options.merge(options)
      if respond_to?(:admin_root_path)
        admin_root_path(**opts)
      elsif respond_to?(:main_app) && main_app.respond_to?(:admin_root_path)
        main_app.admin_root_path(**opts)
      else
        root_path(**opts)
      end
    end

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

