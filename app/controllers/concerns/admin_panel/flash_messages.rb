module AdminPanel
  module FlashMessages
    extend ActiveSupport::Concern

    private

    def flash_notice(action)
      translate_flash(action, :notice)
    end

    def flash_alert(action)
      translate_flash(action, :alert)
    end

    def translate_flash(action, status)
      interpolation = { resource_name: flash_resource_name }.compact

      flash_translation_keys(action, status).each do |key|
        return I18n.t(key, **interpolation) if I18n.exists?(key, locale: I18n.locale)
      end

      I18n.t("flash.actions.#{action}.#{status}", **interpolation)
    end

    def flash_translation_keys(action, status)
      keys = []

      if respond_to?(:resource_class, true) && resource_class.present?
        plural = resource_class.model_name.plural
        keys << "flash.admin.#{plural}.#{action}.#{status}"
        keys << "flash.#{plural}.#{action}.#{status}"
      end

      keys + [
        "flash.admin.actions.#{action}.#{status}",
        "flash.actions.#{action}.#{status}"
      ]
    end

    def flash_resource_name
      return resource_name if respond_to?(:resource_name, true)

      nil
    end
  end
end
