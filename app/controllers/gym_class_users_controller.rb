class GymClassUsersController < ApplicationController
  before_action :set_gym_class_user, only: %i[show update destroy]

  # GET /gym_class_users
  def index
    @gym_class_users = GymClassUser.all

    render json: @gym_class_users
  end

  # GET /gym_class_users/1
  def show
    render json: @gym_class_user
  end

  # POST /gym_class_users
  def create
    @gym_class_user = GymClassUser.new(gym_class_user_params)

    if @gym_class_user.save
      render json: @gym_class_user, status: :created, location: @gym_class_user
    else
      render json: @gym_class_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gym_class_users/1
  def destroy
    @gym_class_user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_gym_class_user
    @gym_class_user = GymClassUser.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def gym_class_user_params
    params.require(:gym_class_user).permit(:user_id, :gym_class_id)
  end
end
