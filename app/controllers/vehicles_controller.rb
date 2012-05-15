class VehiclesController < ApplicationController

  before_filter :setup #each view needs @vehicles defined to create links
  
  # GET /vehicles
  # GET /vehicles.json
  def index
    #@vehicles = Vehicle.all -- now part of before_filter

    respond_to do |format|
      format.html {render :layout => 'home_view'}# index.html.erb
      format.json { render json: @vehicles }
    end
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
    @vehicles = Vehicle.all #needed to fill in top nav bar w/ all vehicles
    @vehicle = Vehicle.find(params[:id])
    #@location = @vehicle.locations.reverse[0] #probably a faster way to do this
    respond_to do |format|
        format.html {render :layout => 'map_view'}# show.html.erb
        format.json { render :json =>{:vehicle=> @vehicle,
                                    :location => @vehicle.location}}
    
    end
  end


  # GET /vehicles/new
  # GET /vehicles/new.json
  def new
    @vehicle = Vehicle.new

    respond_to do |format|
      format.html {render :layout => 'home_view'}
      format.json { render json: @vehicle }
    end
  end
  
  # GET /vehicles/1/edit
  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    @vehicle = Vehicle.new(params[:vehicle])
    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully created.' }
        format.json { render json: @vehicle, status: :created, location: @vehicle }
      else
        format.html { render action: "new", :layout=>'home_view' } #need to use home view b/c no vehicle id
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vehicles/1
  # PUT /vehicles/1.json
  def update
    @vehicle = Vehicle.find(params[:id])

    respond_to do |format|
      if @vehicle.update_attributes(params[:vehicle])
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy

    respond_to do |format|
      format.html { redirect_to vehicles_url }
      format.json { head :no_content }
    end
  end
  
  private
    def setup
      @vehicles = Vehicle.all
    end
end
