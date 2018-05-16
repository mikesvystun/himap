class PlacesController < ApplicationController
  def index
    @places = Place.all
    @hash = Gmaps4rails.build_markers(@places) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
    end
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)


    redirect_to root_path if @place.save
    
  end


  private
  
  def place_params
    params.require(:place).permit(:name, :address)
  end

end
