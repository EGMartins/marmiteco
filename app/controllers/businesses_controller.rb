class BusinessesController < ApplicationController
  before_action :set_business, only: %i[show edit update destroy]
  respond_to :html, :json

  def index
    @businesses = Business.all
    respond_with @businesses
  end

  def show
  end

  def new
    @business = Business.new
    respond_with @business
  end

  def edit
  end

  def create
    @business = Business.new(business_params)
    @user = User.find(session[:id])
    flash[:notice] = 'Seu negócio foi criado!' if @business.save
    @user.business = @business
    @user.save
    respond_with @business
  end

  def update
    flash[:notice] = 'Negócio atualizado' if @business.update(business_params)
    respond_with @business
  end

  def destroy
    @business.destroy
    flash[:notice] = 'Negócio apagado!' if @business.destroy
    respond_with @business
  end

  private

    def set_business
      @business = Business.find(params[:id])
    end

    def business_params
      params.require(:business).permit(:business_name, :business_info, :business_time, :business_street, :business_number, :business_neighbor, :business_city, :business_state, :latitude, :longitude)
    end
end
