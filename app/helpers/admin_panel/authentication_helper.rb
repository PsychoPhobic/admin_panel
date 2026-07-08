module AdminPanel
  module AuthenticationHelper
    INPUT_CLASSES = "bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500".freeze
    LABEL_CLASSES = "block mb-2 text-sm font-medium text-gray-900 dark:text-white".freeze
    CHECKBOX_CLASSES = "w-4 h-4 border-gray-300 rounded bg-gray-50 focus:ring-3 focus:ring-primary-300 dark:focus:ring-primary-600 dark:ring-offset-gray-800 dark:bg-gray-700 dark:border-gray-600".freeze
    SUBMIT_CLASSES = "w-full px-5 py-3 text-base font-medium text-center text-white bg-primary-700 rounded-lg hover:bg-primary-800 focus:ring-4 focus:ring-primary-300 sm:w-auto dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800 cursor-pointer".freeze
    LINK_CLASSES = "text-primary-700 hover:underline dark:text-primary-500".freeze

    def auth_input_classes
      INPUT_CLASSES
    end

    def auth_label_classes
      LABEL_CLASSES
    end

    def auth_checkbox_classes
      CHECKBOX_CLASSES
    end

    def auth_submit_classes
      SUBMIT_CLASSES
    end

    def auth_link_classes
      LINK_CLASSES
    end
  end
end
