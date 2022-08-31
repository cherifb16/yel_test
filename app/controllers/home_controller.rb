class HomeController < ApplicationController
    def index
        if params[:name].present?
            @properties = Property.search_name(params[:name])
        else
            @properties = Property.all
        end
    end

    def show
        if current_user
          @favorite = current_user.favorites.find_by(property_id: @property.id)
        else
        end
    end
end
