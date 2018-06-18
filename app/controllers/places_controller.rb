class PlacesController < ApplicationController
  def index
    @places = Place.all
    @hash = Gmaps4rails.build_markers(@places) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      marker.json({founded: place.founded})
    end
    @bounds = bounds
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

  def bounds
    a = {}
    a["north"] = Place.maximum(:latitude) 
    a["south"] = Place.minimum(:latitude)
    a["east"] = Place.maximum(:longitude) 
    a["west"] = Place.minimum(:longitude)
    return a
  end

end
