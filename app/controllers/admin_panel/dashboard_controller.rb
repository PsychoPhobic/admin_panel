module AdminPanel
  class DashboardController < ApplicationController
    # before_action :authenticate_user!
    # before_action :ensure_admin!

    def index
    end

    private

    def ensure_admin!
      redirect_to root_path, alert: t("admin_panel.flash.not_authorized") unless current_user&.admin?
    end
  end
end
