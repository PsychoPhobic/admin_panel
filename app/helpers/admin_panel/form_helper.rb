module AdminPanel
  module FormHelper
    FORM_LABEL_CLASSES = "block mb-2 text-sm font-medium text-gray-900 dark:text-white"
    FORM_HINT_CLASSES = "mb-4 text-sm text-gray-500 dark:text-gray-400"
    FORM_INPUT_CLASSES = "shadow-sm bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
    FORM_TEXTAREA_CLASSES = "block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
    FORM_SELECT_CLASSES = "bg-gray-50 border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
    FORM_PASSWORD_CLASSES = "bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
    FORM_FILE_CLASSES = "block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400"
    FORM_CHECKBOX_CLASSES = "w-4 h-4 text-primary-600 bg-gray-100 border-gray-300 rounded focus:ring-primary-500 dark:focus:ring-primary-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600"
    FORM_TOGGLE_LABEL_CLASSES = "relative inline-flex items-center cursor-pointer"
    FORM_TOGGLE_INPUT_CLASSES = "sr-only peer"
    FORM_TOGGLE_TRACK_CLASSES = "w-11 h-6 bg-gray-200 peer-focus:outline-none peer-focus:ring-4 peer-focus:ring-primary-300 dark:peer-focus:ring-primary-800 rounded-full peer dark:bg-gray-700 peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:start-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all dark:border-gray-600 peer-checked:bg-primary-600 dark:peer-checked:bg-primary-600"
    FORM_ERROR_ALERT_CLASSES = "p-4 mb-4 text-sm text-red-800 rounded-lg bg-red-50 dark:bg-gray-800 dark:text-red-400"
    FORM_GRID_CLASSES = "grid grid-cols-6 gap-6"
    FORM_ACTIONS_CLASSES = "col-span-6 sm:col-full flex items-center space-x-2 sm:space-x-3"
    FORM_SUBMIT_CLASSES = "text-white bg-primary-700 hover:bg-primary-800 focus:ring-4 focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800 cursor-pointer"
    FORM_CANCEL_CLASSES = "py-2.5 px-5 text-sm font-medium text-gray-900 focus:outline-none bg-white rounded-lg border border-gray-200 hover:bg-gray-100 hover:text-primary-700 focus:z-10 focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700"
    FORM_PRIMARY_BUTTON_CLASSES = "inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white rounded-lg bg-primary-700 hover:bg-primary-800 focus:ring-4 focus:ring-primary-300 dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800"
    FORM_SECONDARY_BUTTON_CLASSES = "py-2 px-3 text-sm font-medium text-gray-900 focus:outline-none bg-white rounded-lg border border-gray-200 hover:bg-gray-100 hover:text-primary-700 focus:z-10 focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700"
    FORM_SECTION_CARD_CLASSES = "p-4 mb-4 bg-white border border-gray-200 rounded-lg shadow-sm dark:border-gray-700 sm:p-6 dark:bg-gray-800"
    FORM_SECTION_TITLE_CLASSES = "mb-4 text-xl font-semibold dark:text-white"

    def crud_form_label_classes
      FORM_LABEL_CLASSES
    end

    def crud_form_input_classes
      FORM_INPUT_CLASSES
    end

    def crud_form_textarea_classes
      FORM_TEXTAREA_CLASSES
    end

    def crud_form_select_classes
      FORM_SELECT_CLASSES
    end

    def crud_form_password_classes
      FORM_PASSWORD_CLASSES
    end

    def crud_form_file_classes
      FORM_FILE_CLASSES
    end

    def crud_form_checkbox_classes
      FORM_CHECKBOX_CLASSES
    end

    def crud_form_submit_classes
      FORM_SUBMIT_CLASSES
    end

    def crud_form_grid_classes
      FORM_GRID_CLASSES
    end

    def crud_form_cancel_classes
      FORM_CANCEL_CLASSES
    end

    def crud_form_primary_button_classes
      FORM_PRIMARY_BUTTON_CLASSES
    end

    def crud_form_secondary_button_classes
      FORM_SECONDARY_BUTTON_CLASSES
    end

    def crud_form_field_column_class(column)
      crud_form_full_width?(column) ? "col-span-6" : "col-span-6 sm:col-span-3"
    end

    def crud_form_full_width?(column)
      crud_form_textarea?(column) || crud_form_file_field?(column)
    end

    def crud_form_textarea?(column)
      column.to_s == "description" || resource_class.columns_hash[column.to_s]&.type == :text
    end

    def crud_form_number_field?(column)
      %i[integer float decimal].include?(resource_class.columns_hash[column.to_s]&.type)
    end

    def crud_form_email_field?(column)
      name = column.to_s
      name.include?("email") || name.end_with?("_email")
    end

    def crud_form_password_field?(column)
      column.to_s.include?("password")
    end

    def crud_form_date_field?(column)
      %i[date datetime].include?(resource_class.columns_hash[column.to_s]&.type)
    end

    def crud_form_datetime_field?(column)
      resource_class.columns_hash[column.to_s]&.type == :datetime
    end

    def crud_form_boolean_field?(column)
      resource_class.columns_hash[column.to_s]&.type == :boolean
    end

    def crud_form_file_field?(column)
      name = column.to_s
      name.include?("image") || name.include?("avatar") || name.include?("photo") || name.include?("file")
    end

    def crud_form_url_field?(column)
      %w[website url homepage].include?(column.to_s) || column.to_s.end_with?("_url")
    end

    def crud_form_select_field?(column)
      resource_class.respond_to?(:defined_enums) && resource_class.defined_enums.key?(column.to_s)
    end

    def crud_form_enum_options(column)
      resource_class.defined_enums.fetch(column.to_s).map do |label, _value|
        [ label.humanize, label ]
      end
    end

    def crud_form_field_type(column)
      return :textarea if crud_form_textarea?(column)
      return :password if crud_form_password_field?(column)
      return :email if crud_form_email_field?(column)
      return :select if crud_form_select_field?(column)
      return :toggle if crud_form_boolean_field?(column)
      return :file if crud_form_file_field?(column)
      return :datetime if crud_form_datetime_field?(column)
      return :date if crud_form_date_field?(column)
      return :number if crud_form_number_field?(column)
      return :url if crud_form_url_field?(column)

      :text
    end

    def crud_form_errors(resource)
      return "".html_safe unless resource.errors.any?

      content_tag(:div, class: FORM_ERROR_ALERT_CLASSES, role: "alert") do
        safe_join([
          content_tag(:p, t(
            "admin_panel.crud.errors_prohibited",
            count: resource.errors.count,
            resource: resource_class.model_name.human.downcase
          ), class: "font-medium"),
          content_tag(:ul, class: "mt-2 list-disc list-inside") do
            safe_join(resource.errors.map { |error| content_tag(:li, error.full_message) })
          end
        ])
      end
    end

    def crud_form_label(form, method, text: nil, **options)
      form.label(method, text, class: crud_form_label_classes, **options)
    end

    def crud_form_hint(text)
      return if text.blank?

      content_tag(:div, text, class: FORM_HINT_CLASSES)
    end

    def crud_form_text_field(form, method, **options)
      form.text_field(method, { class: crud_form_input_classes }.merge(options))
    end

    def crud_form_email_field(form, method, **options)
      form.email_field(method, { class: crud_form_input_classes }.merge(options))
    end

    def crud_form_number_field(form, method, **options)
      form.number_field(method, { class: crud_form_input_classes }.merge(options))
    end

    def crud_form_password_field(form, method, **options)
      form.password_field(method, { class: crud_form_password_classes, autocomplete: "new-password" }.merge(options))
    end

    def crud_form_date_field(form, method, **options)
      form.date_field(method, { class: crud_form_input_classes }.merge(options))
    end

    def crud_form_datetime_field(form, method, **options)
      form.datetime_local_field(method, { class: crud_form_input_classes }.merge(options))
    end

    def crud_form_textarea_field(form, method, rows: 4, **options)
      form.text_area(method, { rows: rows, class: crud_form_textarea_classes }.merge(options))
    end

    def crud_form_select_field(form, method, choices = nil, select_options: {}, **html_options)
      choices ||= crud_form_enum_options(method)
      form.select(
        method,
        choices,
        select_options,
        { class: crud_form_select_classes }.merge(html_options)
      )
    end

    def crud_form_url_field(form, method, **options)
      form.url_field(method, { class: crud_form_input_classes }.merge(options))
    end

    def crud_form_file_field(form, method, **options)
      form.file_field(method, { class: crud_form_file_classes }.merge(options))
    end

    def crud_form_checkbox_field(form, method, **options)
      form.check_box(method, { class: crud_form_checkbox_classes }.merge(options))
    end

    def crud_form_toggle_field(form, method, **options)
      checkbox_id = options.delete(:id) || "#{form.object_name}_#{method}".tr("[]", "_").squeeze("_")

      content_tag(:label, for: checkbox_id, class: FORM_TOGGLE_LABEL_CLASSES) do
        safe_join([
          form.check_box(method, { class: FORM_TOGGLE_INPUT_CLASSES, id: checkbox_id }.merge(options)),
          content_tag(:div, nil, class: FORM_TOGGLE_TRACK_CLASSES)
        ])
      end
    end

    def crud_form_toggle_row(form, method, title:, description: nil, **options)
      content_tag(:div, class: "flex items-center justify-between py-4") do
        safe_join([
          content_tag(:div, class: "flex flex-col flex-grow") do
            safe_join([
              content_tag(:div, title, class: "text-lg font-semibold text-gray-900 dark:text-white"),
              description.present? ? content_tag(:div, description, class: "text-base font-normal text-gray-500 dark:text-gray-400") : nil
            ].compact)
          end,
          crud_form_toggle_field(form, method, **options)
        ])
      end
    end

    def crud_form_control(form, method, **options)
      case crud_form_field_type(method)
      when :textarea then crud_form_textarea_field(form, method, **options)
      when :password then crud_form_password_field(form, method, **options)
      when :email then crud_form_email_field(form, method, **options)
      when :select then crud_form_select_field(form, method, **options)
      when :toggle then crud_form_toggle_field(form, method, **options)
      when :file then crud_form_file_field(form, method, **options)
      when :datetime then crud_form_datetime_field(form, method, **options)
      when :date then crud_form_date_field(form, method, **options)
      when :number then crud_form_number_field(form, method, **options)
      when :url then crud_form_url_field(form, method, **options)
      else crud_form_text_field(form, method, **options)
      end
    end

    def crud_form_field(form, method, label: nil, hint: nil, column_class: nil, **options)
      label_options = options.extract!(:label_options)

      content_tag(:div, class: column_class || crud_form_field_column_class(method)) do
        safe_join([
          crud_form_label(form, method, text: label, **label_options),
          crud_form_hint(hint),
          crud_form_control(form, method, **options)
        ].compact)
      end
    end

    def crud_form_submit(form, label: nil, **options)
      form.submit(label || crud_form_save_label, { class: crud_form_submit_classes }.merge(options))
    end

    def crud_form_cancel(url: collection_path, label: nil, **options)
      link_to(
        label || t("admin_panel.crud.cancel", default: "Cancel"),
        url,
        { class: crud_form_cancel_classes }.merge(options)
      )
    end

    def crud_form_primary_button(label, **options)
      button_tag(label, { type: "button", class: crud_form_primary_button_classes }.merge(options))
    end

    def crud_form_secondary_button(label, **options)
      button_tag(label, { type: "button", class: crud_form_secondary_button_classes }.merge(options))
    end

    def crud_form_actions(form, cancel_url: collection_path, **options)
      content_tag(:div, class: FORM_ACTIONS_CLASSES) do
        safe_join([
          crud_form_submit(form, **options),
          crud_form_cancel(url: cancel_url)
        ])
      end
    end

    def crud_form_section(title:, &block)
      content_tag(:div, class: FORM_SECTION_CARD_CLASSES) do
        safe_join([
          content_tag(:h3, title, class: FORM_SECTION_TITLE_CLASSES),
          capture(&block)
        ])
      end
    end

    def crud_form_image_upload(form, method, preview_url: nil, title: nil, hint: nil, upload_label: nil, delete_label: nil)
      content_tag(:div, class: "items-center sm:flex xl:block 2xl:flex sm:space-x-4 xl:space-x-0 2xl:space-x-4") do
        safe_join([
          preview_url.present? ? image_tag(preview_url, class: "mb-4 rounded-lg w-28 h-28 sm:mb-0 xl:mb-4 2xl:mb-0", alt: title) : nil,
          content_tag(:div) do
            safe_join([
              title.present? ? content_tag(:h3, title, class: "mb-1 text-xl font-bold text-gray-900 dark:text-white") : nil,
              hint.present? ? content_tag(:div, hint, class: FORM_HINT_CLASSES) : nil,
              content_tag(:div, class: "flex items-center space-x-4") do
                safe_join([
                  content_tag(:label, class: "#{crud_form_primary_button_classes} cursor-pointer") do
                    safe_join([
                      form.file_field(method, class: "sr-only"),
                      upload_label || t("admin_panel.crud.upload", default: "Upload picture")
                    ])
                  end,
                  crud_form_secondary_button(delete_label || t("admin_panel.crud.delete", default: "Delete"))
                ])
              end
            ].compact)
          end
        ].compact)
      end
    end
  end
end
