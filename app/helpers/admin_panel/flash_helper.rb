module AdminPanel
  module FlashHelper
    FLASH_VARIANTS = {
      "notice" => :success,
      "success" => :success,
      "alert" => :danger,
      "error" => :danger,
      "warning" => :warning
    }.freeze

    FLASH_STYLES = {
      success: {
        wrapper: "text-green-800 bg-green-50 dark:bg-gray-800 dark:text-green-400",
        dismiss: "bg-green-50 text-green-500 focus:ring-green-400 hover:bg-green-200 dark:bg-gray-800 dark:text-green-400 dark:hover:bg-gray-700",
        label: "Success"
      },
      danger: {
        wrapper: "text-red-800 bg-red-50 dark:bg-gray-800 dark:text-red-400",
        dismiss: "bg-red-50 text-red-500 focus:ring-red-400 hover:bg-red-200 dark:bg-gray-800 dark:text-red-400 dark:hover:bg-gray-700",
        label: "Error"
      },
      warning: {
        wrapper: "text-yellow-800 bg-yellow-50 dark:bg-gray-800 dark:text-yellow-300",
        dismiss: "bg-yellow-50 text-yellow-500 focus:ring-yellow-400 hover:bg-yellow-200 dark:bg-gray-800 dark:text-yellow-300 dark:hover:bg-gray-700",
        label: "Warning"
      },
      info: {
        wrapper: "text-blue-800 bg-blue-50 dark:bg-gray-800 dark:text-blue-400",
        dismiss: "bg-blue-50 text-blue-500 focus:ring-blue-400 hover:bg-blue-200 dark:bg-gray-800 dark:text-blue-400 dark:hover:bg-gray-700",
        label: "Info"
      }
    }.freeze

    def flash_messages?
      flash.any? { |_, message| message.present? }
    end

    def flash_variant(type)
      FLASH_VARIANTS.fetch(type.to_s, :info)
    end

    def flash_wrapper_classes(type)
      "flex items-center p-4 mb-4 text-sm rounded-lg #{FLASH_STYLES.fetch(flash_variant(type))[:wrapper]}"
    end

    def flash_dismiss_classes(type)
      "ms-auto -mx-1.5 -my-1.5 #{FLASH_STYLES.fetch(flash_variant(type))[:dismiss]} rounded-lg focus:ring-2 p-1.5 inline-flex items-center justify-center h-8 w-8"
    end

    def flash_screen_reader_label(type)
      FLASH_STYLES.fetch(flash_variant(type))[:label]
    end
  end
end
