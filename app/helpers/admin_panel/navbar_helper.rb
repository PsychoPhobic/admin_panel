module AdminPanel
  module NavbarHelper
    # Returns `[{ label:, url:, icon_html: }, ...]` for the navbar apps dropdown.
    # Override in the host app to register shortcuts.
    def admin_panel_navbar_apps
      []
    end

    # Public app URL for the top-bar "view site" button. Override in the host if needed.
    def admin_panel_public_app_path
      helpers = respond_to?(:main_app) ? main_app : self
      return unless helpers.respond_to?(:root_path)

      helpers.root_path
    rescue ArgumentError, NoMethodError
      nil
    end
  end
end
