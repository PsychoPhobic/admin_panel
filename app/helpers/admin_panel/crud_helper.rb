require "admin_panel/crud/partial_resolver"

module AdminPanel
  module CrudHelper
    include FormHelper

    def render_crud_partial(slot, **locals)
      partial = AdminPanel::Crud::PartialResolver.new(lookup_context, resource_class).resolve(slot)
      return "".html_safe unless partial

      render partial: partial, locals: locals
    end

    def crud_cell_value(resource, column)
      value = resource.public_send(column)
      return "" if value.blank?

      if column.to_s == "website"
        link_to "Website", value, target: "_blank", rel: "noopener"
      else
        value.to_s
      end
    end

    def crud_show_value(resource, column)
      crud_cell_value(resource, column)
    end

    def crud_show_path(resource)
      url_for(action: :show, id: resource.id)
    end

    def crud_show_title(resource = @resource)
      return resource_class.model_name.human unless resource

      primary = crud_primary_column
      if primary
        value = resource.public_send(primary)
        return value.to_s if value.present?
      end

      resource_class.model_name.human
    end

    def crud_show_section_title
      crud_form_section_title
    end

    def crud_back_to_index_label
      t(
        "admin_panel.crud.back_to_index",
        resource: crud_index_title,
        default: "Back to %{resource}"
      )
    end

    def crud_show_actions(resource)
      content_tag(:div, class: FORM_ACTIONS_CLASSES) do
        safe_join([
          link_to(
            t("admin_panel.crud.edit_resource", resource: resource_class.model_name.human),
            crud_edit_path(resource),
            class: "#{crud_form_submit_classes} inline-flex items-center"
          ),
          link_to(crud_back_to_index_label, collection_path, class: crud_form_cancel_classes),
          crud_delete_button(resource)
        ])
      end
    end

    def crud_delete_confirm_message
      t(
        "admin_panel.crud.delete_confirm_message",
        default: t("admin_panel.crud.delete_confirm", default: "Are you sure?")
      )
    end

    def crud_delete_button(resource)
      confirm_message = crud_delete_confirm_message

      button_to(
        crud_destroy_path(resource),
        method: :delete,
        form: {
          class: "inline",
          data: { turbo_confirm: confirm_message }
        },
        data: { turbo_confirm: confirm_message },
        class: "inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-red-600 rounded-lg hover:bg-red-800 focus:ring-4 focus:ring-red-300 dark:focus:ring-red-900"
      ) do
        safe_join([
          content_tag(:svg, class: "w-4 h-4 mr-2", fill: "currentColor", viewBox: "0 0 20 20", xmlns: "http://www.w3.org/2000/svg") do
            tag.path(fill_rule: "evenodd", d: "M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z", clip_rule: "evenodd")
          end,
          t("admin_panel.crud.delete_item", default: "Delete item")
        ])
      end
    end

    def crud_edit_path(resource)
      url_for(action: :edit, id: resource.id)
    end

    def crud_destroy_path(resource)
      url_for(action: :destroy, id: resource.id)
    end

    def crud_new_path
      url_for(action: :new)
    end

    def crud_create_path
      url_for(action: :index)
    end

    def crud_index_title
      resource_class.model_name.human(count: 2)
    end

    def crud_search_input_id
      "#{resource_class.model_name.plural}-search"
    end

    def crud_search_placeholder
      t(
        "admin_panel.crud.search_for",
        resource: resource_class.model_name.human(count: 2),
        default: "Search for %{resource}"
      )
    end

    def crud_add_new_label
      t(
        "admin_panel.crud.add_new",
        resource: resource_class.model_name.human,
        default: "Add new %{resource}"
      )
    end

    def crud_add_submit_label
      t(
        "admin_panel.crud.add_submit",
        resource: resource_class.model_name.human,
        default: "Add %{resource}"
      )
    end

    def crud_form_title
      resource = resource_class.model_name.human
      if @resource&.persisted?
        t("admin_panel.crud.edit_title", resource: resource, default: "Edit %{resource}")
      else
        t("admin_panel.crud.new_title", resource: resource, default: "New %{resource}")
      end
    end

    def crud_form_section_title
      t("admin_panel.crud.general_information", default: "General information")
    end

    def crud_form_save_label
      if @resource&.persisted?
        t("admin_panel.crud.save", default: "Save")
      else
        crud_add_submit_label
      end
    end

    def crud_form_url(resource)
      if resource.persisted?
        url_for(action: :update, id: resource.id)
      else
        url_for(action: :create)
      end
    end

    def crud_form_scope
      resource_class.model_name.param_key
    end
  end
end
