class HomeController < ApplicationController
  def index
    if params[:search].present?
      @businesses = Business.near(params[:search], 2, units: :km)
    else
      @businesses = Business.near('Praça da Matriz, Mirassol', 2, units: :km)
    end
    @hash = Gmaps4rails.build_markers(@businesses) do |business, marker|
      marker.lat business.latitude
      marker.lng business.longitude
      marker.infowindow business.business_info
    end
  end
end
