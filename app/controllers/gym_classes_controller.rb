class GymClassesController < ApplicationController
  before_action :set_gym_class, only: %i[show update destroy]

  # GET /gym_classes
  def index
    @gym_classes = GymClass.all

    render json: @gym_classes
  end

  # GET /gym_classes/1
  def show
    render json: @gym_class
  end

  # POST /gym_classes
  def create
    @gym_class = GymClass.create!(gym_class_params)

    render json: @gym_class, status: :created
  end

  # PATCH/PUT /gym_classes/1
  def update
    @gym_class.update!(gym_class_params)

    render json: @gym_class, status: :ok
  end

  # DELETE /gym_classes/1
  def destroy
    @gym_class.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_gym_class
    @gym_class = GymClass.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def gym_class_params
    params.require(:gym_class).permit(:name, :description, :teacher_name, :start_time, :duration, :category_id)
  end
end
