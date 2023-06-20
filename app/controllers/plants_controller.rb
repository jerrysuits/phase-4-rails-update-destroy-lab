class PlantsController < ApplicationController

  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    plant = Plant.find_by(id: params[:id])
    render json: plant
  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  ##patch plant
  def update
    plant = Plant.find_by(id: params[:id])
  
    if plant
      if plant.update(plant_params)
        render json: plant
      else
        render json: { error: 'Failed to update the plant' }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Plant not found' }, status: :not_found
    end
  end
  
    
  #delete plant by id
  def delete
    plant = Plant.find_by(id: params[:id])
    
    if plant
      plant.destroy
      render json: { success: 'Plant deleted successfully' }
    else
      render json: { error: 'Plant not found' }, status: :not_found
    end
  end
  
  
  private

  def plant_params
    params.permit(:name, :id, :image, :price, :is_in_stock)
  end
end
