module AdminPanel
  class CrudController < ApplicationController
    include Pagy::Method



    helper AdminPanel::CrudHelper

    helper_method :resource_class, :crud_columns, :crud_primary_column, :crud_form_columns, :crud_show_columns, :collection_path



    class_attribute :resource_class



    before_action :set_resource, only: %i[show edit update destroy]



    def index
      @pagy, @resources = pagy(:offset, crud_scope)

      @new_resource = resource_class.new

      render "admin_panel/crud/index"
    end



    def show
      render "admin_panel/crud/show"
    end

    def new
      @resource = resource_class.new

      render "admin_panel/crud/new"
    end



    def create
      @resource = resource_class.new(resource_params)



      if @resource.save
        redirect_to after_save_path, notice: flash_notice(:create)

      else

        render "admin_panel/crud/new", status: :unprocessable_entity

      end
    end



    def edit
      render "admin_panel/crud/edit"
    end



    def update
      if @resource.update(resource_params)
        redirect_to after_save_path, notice: flash_notice(:update)

      else

        render "admin_panel/crud/edit", status: :unprocessable_entity

      end
    end



    def destroy
      @resource.destroy



      redirect_to collection_path, notice: flash_notice(:destroy)
    end



    private



    def crud_scope
      resource_class.all
    end



    def crud_columns
      resource_class.column_names - %w[id created_at updated_at]
    end



    def crud_primary_column
      crud_columns.first
    end



    def crud_form_columns
      resource_class.column_names - %w[id created_at updated_at]
    end

    def crud_show_columns
      crud_form_columns
    end



    def set_resource
      @resource = resource_class.find(params[:id])
    end



    def resource_params
      raise NotImplementedError,

        "#{self.class.name} muss #resource_params implementieren."
    end



    def collection_path
      url_for(action: :index)
    end



    def after_save_path
      collection_path
    end



    def resource_name
      resource_class.model_name.human
    end
  end
end
