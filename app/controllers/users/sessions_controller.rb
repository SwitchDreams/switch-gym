# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    # before_action :configure_sign_in_params, only: [:create]

    def new
      render json: { error: "this end-point does not permit GET action" }, status: :unauthorized
    end

    # POST /resource/sign_in
    # def create
    #   super
    # end

    # DELETE /resource/sign_out
    # def destroy
    #   super
    # end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end
    #

    private

    def respond_with(resource, _opts = {})
      if resource.errors.empty?
        render json: resource, status: :ok
      else
        render json: resource.errors.full_messages, status: :unauthorized
      end
    end

    def respond_to_on_destroy
      head :no_content
    end
  end
end
