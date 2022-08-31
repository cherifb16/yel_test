class FavoritesController < ApplicationController
    def create
        favorite = current_user.favorites.create(property_id: params[:property_id])
        redirect_to properties_path, notice: "I registered my property as a favorite"
    end

    def show
        @favorite = current_user.favorites.find_by(property_id: @property.id)
    end

    def index
        @favorites = current_user.favorites
    end
    
    def destroy
        favorite = current_user.favorites.find_by(id: params[:id]).destroy
        redirect_to properties_path, alert: "Unfavorite your property"
    end
end
