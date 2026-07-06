module AdminPanel
  module NavbarHelper
    # Returns `[{ label:, url:, icon_html: }, ...]` for the navbar apps dropdown.
    # Override in the host app to register shortcuts.
    def admin_panel_navbar_apps
      []
    end
  end
end