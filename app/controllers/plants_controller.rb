class PlantsController < ApplicationController
    wrap_parameters format: []
    
    def index 
        plants = Plant.all 
        render json: plants
    end
    def show
        showingPlants = Plant.find_by(id: params[:id])
        if showingPlants
            render json: showingPlants
        else
            render json: { error: 'Plant not found' }, status: :not_found
        end
    end
    def create 
        plantas = Plant.create(plant_params)
        render json: plantas
    end
    private
    def plant_params
        params.permit(:name, :image, :price)
    end
end
