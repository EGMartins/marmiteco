class HomeController < ApplicationController

  def map
    if params[:search].present?
      @businesses = Business.near(params[:search], 2, units: :km)
      # render :json => @businesses
    else
      # @businesses = Business.near('Praça da Matriz, Mirassol', 2, units: :km)
      redirect_to root_path
    end
    @hash = Gmaps4rails.build_markers(@businesses) do |business, marker|
      marker.lat business.latitude
      marker.lng business.longitude
      marker.picture({ url: ActionController::Base.helpers.asset_path("restaurant.png"), width: 32, height: 32 })
      marker.title gmaps4rails_title(business.business_name)
      marker.infowindow gmaps4rails_infowindow(business)
      # marker.infowindow "#{business.business_name} \n #{business.business_info}"
    end

  end

  def json_map
    @businesses = Business.near(params[:search], 2, units: :km)
    render :json => @businesses
  end

  def gmaps4rails_title(business)
    "#{business}"
  end

  def gmaps4rails_infowindow(business)
    "<div id=\"iw-container\"><div class=\"iw-title\">#{business.business_name}</div> <br><br> <em>#{business.business_info}</em> <hr> <p>Funcionamento: #{business.business_time} </p> <hr> <p>Telefone: #{business.business_phone} </p> <hr> <p>#{business.address}</p></div>"
  end

  def home

  end
end
