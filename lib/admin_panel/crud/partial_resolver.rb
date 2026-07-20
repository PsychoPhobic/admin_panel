module AdminPanel
  module Crud
    class PartialResolver
      def initialize(lookup_context, resource_class)
        @lookup_context = lookup_context
        @resource_class = resource_class
      end

      def resolve(slot)
        prefixes.each do |prefix|
          next unless @lookup_context.template_exists?(slot, [ prefix ], true)

          return "#{prefix}/#{slot}"
        end

        nil
      end

      private

      def prefixes
        singular = @resource_class.model_name.element
        plural = @resource_class.model_name.plural

        [
          "admin/#{plural}",
          "admin_panel/crud/#{singular}",
          "admin_panel/crud"
        ]
      end
    end
  end
end
