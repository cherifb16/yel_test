class PropertiesController < ApplicationController
  # before_action :set_access

  # before_action :authenticate_admin!, only: [:index, :show, :new, :create, :edit, :update, :destroy], if: -> { admin_signed_in? }
  # before_action :authenticate_partner!, only: [:index, :show, :new, :create, :edit, :update, :destroy], if: -> { partner_signed_in? }
  # before_action :authenticate_user!, only: [:index, :show], if: -> { user_signed_in? }

  # before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy] 
  # before_action :authenticate_partner!, only: [:new, :create, :edit, :update, :destroy]
  # before_action :authenticate_user!, only: [:show]

  # before_action :authenticate_partner!, less: -> { partner_signed_in? }, only: [:new, :create, :edit, :update, :destroy]
  # before_action :authenticate_admin!, less: -> { admin_signed_in? }, only: [:new, :create, :edit, :update, :destroy]

  # if admin_signed_in?
  #   before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]
  #   before_action :authenticate_admin!, less: -> { admin_signed_in? }, only: [:new, :create, :edit, :update, :destroy]
  # elsif partner_signed_in?
  #   before_action :authenticate_partner!, only: [:new, :create, :edit, :update, :destroy]
  #   before_action :authenticate_partner!, less: -> { partner_signed_in? }, only: [:new, :create, :edit, :update, :destroy]
  # else 
  #   before_action :authenticate_user!, only: [:show]
  #   before_action :authenticate_user!, less: -> { user_signed_in? }, only: [:new, :create, :edit, :update, :destroy]
  # end


  before_action :set_property, only: %i[ show edit update destroy ]

  # def set_access
  #   if admin_signed_in?
  #     before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]
  #     # before_action :authenticate_admin!, less: -> { admin_signed_in? }, only: [:new, :create, :edit, :update, :destroy]
  #   elsif partner_signed_in?
  #     before_action :authenticate_partner!, only: [:new, :create, :edit, :update, :destroy]
  #     # before_action :authenticate_partner!, less: -> { partner_signed_in? }, only: [:new, :create, :edit, :update, :destroy]
  #   else 
  #     before_action :authenticate_user!, only: [:show]
  #     # before_action :authenticate_user!, less: -> { user_signed_in? }, only: [:new, :create, :edit, :update, :destroy]
  #   end
  # end 
  # GET /properties or /properties.json
  def index
    @properties = Property.all
  end

  # GET /properties/1 or /properties/1.json
  def show
    if current_user
      @favorite = current_user.favorites.find_by(property_id: @property.id)
    else
    end
  end

  # GET /properties/new
  def new
    if current_admin || current_partner
      @property = Property.new 
    else
      redirect_to root_path, alert: "Can not access to this page"  
    end  
  end

  # GET /properties/1/edit
  def edit
    if current_admin || current_partner
    else
      redirect_to root_path, alert: "Can not access to this page"  
    end
  end

  # POST /properties or /properties.json
  def create
    if current_admin || current_partner
      @property = Property.new(property_params)

      respond_to do |format|
        if @property.save
          format.html { redirect_to property_url(@property), notice: "Property was successfully created." }
          format.json { render :show, status: :created, location: @property }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @property.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_path, alert: "Can not access to this page"  
    end  
  end

  # PATCH/PUT /properties/1 or /properties/1.json
  def update
    if current_admin || current_partner
      respond_to do |format|
        if @property.update(property_params)
          format.html { redirect_to property_url(@property), notice: "Property was successfully updated." }
          format.json { render :show, status: :ok, location: @property }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @property.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_path, alert: "Can not access to this page"  
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    if current_admin || current_partner
      @property.destroy

      respond_to do |format|
        format.html { redirect_to properties_url, notice: "Property was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      redirect_to root_path, alert: "Can not access to this page"  
    end  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:name, :headline, :description, :city, :state, :country, :address_1, :address_2, :price_cents, :zip_code, images: [])
    end
end
