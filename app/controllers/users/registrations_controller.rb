# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json
    before_action :authenticate_user!, only: :update

    def create
      user = User.create!(user_params)
      render json: user, status: :created
    end

    def update
      current_user.update!(user_params)
      render json: current_user, status: :created
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password, :role, :birthday)
    end
  end
end
