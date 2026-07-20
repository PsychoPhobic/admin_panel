module AdminPanel
  module SidebarHelper
    LINK_CLASSES = "flex items-center p-2 text-base text-gray-900 rounded-lg hover:bg-gray-100 group dark:text-gray-200 dark:hover:bg-gray-700"
    ACTIVE_CLASSES = "bg-gray-100 dark:bg-gray-700"
    SUB_LINK_CLASSES = "flex items-center p-2 text-base text-gray-900 transition duration-75 rounded-lg pl-11 group hover:bg-gray-100 dark:text-gray-200 dark:hover:bg-gray-700"
    DEFAULT_DROPDOWN_LIST_CLASSES = "py-2 space-y-2 hidden"

    def sidebar_link(label:, url:, icon: nil, active: nil)
      active = sidebar_active?(url) if active.nil?

      render "admin_panel/sidebar/link", label: label, url: url, icon: icon, active: active
    end

    def sidebar_dropdown(id:, label:, icon:, list_class: DEFAULT_DROPDOWN_LIST_CLASSES, &block)
      render "admin_panel/sidebar/dropdown",
             id: id,
             label: label,
             icon: icon,
             list_class: list_class,
             content: capture(&block)
    end

    def sidebar_sub_link(label:, url:, active: nil)
      active = sidebar_active?(url) if active.nil?

      render "admin_panel/sidebar/sub_link", label: label, url: url, active: active
    end

    def sidebar_link_classes(active)
      [ LINK_CLASSES, (ACTIVE_CLASSES if active) ].compact.join(" ")
    end

    def sidebar_sub_link_classes(active)
      [ SUB_LINK_CLASSES, (ACTIVE_CLASSES if active) ].compact.join(" ")
    end

    def sidebar_active?(url)
      return false if url.is_a?(String) && (url.start_with?("http") || url.start_with?("#"))

      current_page?(url)
    rescue ActionController::UrlGenerationError, NoMethodError
      false
    end

    def admin_panel_crud_nav_items
      admin_panel_nav_items(section: :crud)
    end

    def admin_panel_system_nav_items
      admin_panel_nav_items(section: :system)
    end

    def admin_panel_public_maintenance_path
      host_route { maintenance_path(locale: I18n.locale) }
    end

    def admin_panel_public_not_found_path
      "/404"
    end

    def admin_panel_public_sign_in_path
      host_route { new_user_session_path }
    end

    def admin_panel_public_sign_up_path
      host_route { new_user_registration_path }
    end

    def admin_panel_public_forgot_password_path
      host_route { new_user_password_path }
    end

    def admin_panel_public_reset_password_path
      host_route { edit_user_password_path }
    end

    def admin_panel_nav_items(section: :crud)
      AdminPanel::Navigation.for_section(section).map { |item| resolve_nav_item(item) }
    end

    private

    def host_route(&block)
      if respond_to?(:main_app)
        main_app.instance_exec(&block)
      else
        yield
      end
    rescue ActionController::UrlGenerationError, NoMethodError
      "#"
    end

    def resolve_nav_item(item)
      {
        label: resolve_nav_value(item.label),
        url: resolve_nav_value(item.url)
      }
    end

    def resolve_nav_value(value)
      return value unless value.is_a?(Proc)

      case value.arity
      when 0 then instance_exec(&value)
      else value.call(self)
      end
    end
  end
end
