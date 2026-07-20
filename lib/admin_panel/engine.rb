module AdminPanel
  class Engine < ::Rails::Engine
    isolate_namespace AdminPanel

    config.before_configuration do
      require "admin_panel/navigation"
      require "admin_panel/crud"
      require "admin_panel/crud/dsl"
    end

    config.admin_panel = ActiveSupport::OrderedOptions.new
    config.admin_panel.available_locales = [ :en, :de ]
    config.admin_panel.default_locale = :en

    initializer "admin_panel.i18n" do
      I18n.available_locales |= config.admin_panel.available_locales
    end

    initializer "admin_panel.sync_host_i18n", after: :load_config_initializers do
      i18n = Rails.application.config.i18n
      config.admin_panel.default_locale = i18n.default_locale
      config.admin_panel.available_locales = Array(i18n.available_locales).map(&:to_sym)
    end
  end
end
