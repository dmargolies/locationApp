class LocationsController < ApplicationController

  before_filter :setup #each view needs @vehicles defined to create links
  
    #POST /vehicles/:vehicle_id/locations/rider
  def rider
    logger.info("************************************ ")
    logger.debug("######################################")
    #logger.debug(params)
    #req = ActiveSupport::JSON.decode(request.body)
    #@req = request.body
    logger.debug("params are" + params.inspect)
    @vehicle = Vehicle.find(params[:vehicle_id])
    @location = @vehicle.locations.create(params[:location])
    #puts('hello world')
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location }
    end
  end
  
  def create
    @vehicle = Vehicle.find(params[:vehicle_id])
    #logger.info("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
    #logger.debug("params: " + params.inspect)
    @location = @vehicle.locations.create(params[:location])
    
    @vehicle.location = @location
    @vehicle.save
    #respond_to do |format|
    #  format.json {render json: @location}
    #  format.html {redirect_to vehicle_path(@vehicle)}
    #end
    redirect_to vehicle_path(@vehicle)
  end

  def new
    @vehicle = Vehicle.find(params[:vehicle_id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location }
    end
  end
           
  #GET requests
  def show
    @vehicle = Vehicle.find(params[:vehicle_id])
    @location = @vehicle.locations.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location }
    end
  end
  
  
  def index
    @vehicle =Vehicle.find(params[:vehicle_id])
    @locations = @vehicle.locations
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @locations }
    end
  end
  
  def destroy
    @vehicle = Vehicle.find(params[:id])
    @location = @vehicle.locations.find(params[:id])
    
    @location.destroy

    respond_to do |format|
      format.html { redirect_to buses_url }
      format.json { head :no_content }
    end
  end
  
  #only private methods below
  private
    def setup
      @vehicles = Vehicle.all
    end
end
