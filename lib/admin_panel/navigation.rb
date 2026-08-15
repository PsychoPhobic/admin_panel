module AdminPanel
  module Navigation
    Item = Struct.new(:key, :label, :url, :section, :icon, :group, :group_label, keyword_init: true)

    class << self
      def items
        @items ||= []
      end

      def register(key, label:, url:, section: :crud, icon: nil, **opts)
        items.reject! { |item| item.key == key }
        items << Item.new(
          key: key,
          label: label,
          url: url,
          section: section,
          icon: icon,
          group: opts[:group],
          group_label: opts[:group_label]
        )
      end

      def for_section(section)
        items.select { |item| item.section == section }
      end

      def reset!
        @items = []
      end

      # Löst einen URL-Helper auf. In der isolierten Engine liegen Host-Routen
      # (z. B. admin_bands_path) hinter main_app; Engine-Routen direkt am Kontext.
      def route(helpers, name, **options)
        targets = []
        targets << helpers.main_app if helpers.respond_to?(:main_app)
        targets << helpers

        targets.each do |target|
          begin
            return target.public_send(name, **options)
          rescue NoMethodError
            next
          end
        end

        "#"
      end
    end
  end
end
