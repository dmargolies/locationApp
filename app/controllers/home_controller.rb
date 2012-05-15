class HomeController < ApplicationController
  before_filter :setup #each view needs @vehicles defined to create links
    
  #make sure @vehicle (singular) is NOT set
  #if @vehicle not null, "home" will not be highlighted in view  
  def index
      respond_to do |format|
      format.html {render :layout => 'home_view'}# index.html.erb
    end
  end
  
  #only private methods below
  private
    def setup
      @vehicles = Vehicle.all
    end
end
