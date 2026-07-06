module AdminPanel
  module AuthHelper
    def admin_sign_out_path(**options)
      opts = { locale: I18n.locale }.merge(options)
      AdminPanel::Navigation.route(self, :admin_destroy_session_path, **opts)
    end
  end
end
