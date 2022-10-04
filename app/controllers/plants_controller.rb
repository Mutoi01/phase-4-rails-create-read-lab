class PlantsController < ApplicationController
  # Get /plants
  def index
      plant = Plant.all
      render json: plant
  end

  # Post /plants
  def create
      plant = Plant.create(plant_params)
      render json: plant, status: :created
  end

   # GET /plants/:id
   def show
      plant = Plant.find_by(id: params[:id])
      if plant
        render json: plant
      else
        render json: { error: "plant not found" }, status: :not_found
      end
    end

    private
    def plant_params
      params.permit(:name, :image, :price)
    end
end