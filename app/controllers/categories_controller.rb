class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show update destroy]

  # GET /categories
  def index
    @categories = Category.all

    render json: @categories
  end

  # GET /categories/1
  def show
    render json: @category
  end

  # POST /categories
  def create
    @category = Category.create!(category_params)

    render json: @category, status: :created
  end

  # PATCH/PUT /categories/1
  def update
    @category.update!(category_params)

    render json: @category
  end

  # DELETE /categories/1
  def destroy
    @category.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :description)
  end
end
