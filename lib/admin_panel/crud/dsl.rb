require "admin_panel/navigation"

module AdminPanel
  module Crud
    module Dsl
      def crud_for(model, label: nil, path: nil, section: :crud, icon: nil)
        plural = model.model_name.plural

        AdminPanel::Navigation.register(
          plural.to_sym,
          label: label || -> { model.model_name.human(count: 2) },
          url: path || ->(helpers) { AdminPanel::Navigation.route(helpers, "admin_#{plural}_path") },
          section: section,
          icon: icon
        )
      end

      def admin_page(key, label:, path:, section: :crud, icon: nil)
        AdminPanel::Navigation.register(
          key,
          label: label,
          url: resolve_admin_page_url(path),
          section: section,
          icon: icon
        )
      end

      private

      def resolve_admin_page_url(path)
        case path
        when Proc then path
        when String, Symbol
          helper = path.to_s
          helper = "#{helper}_path" unless helper.end_with?("_path")
          ->(helpers) { AdminPanel::Navigation.route(helpers, helper) }
        else
          path
        end
      end
    end
  end
end
