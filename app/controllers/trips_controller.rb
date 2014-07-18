class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit
  end
  
  def place_details
    
  end
  
  def trip_details
    
  end
  
  # Saved Trips 
  def saved_trips
    @trips = Trip.all 
  end
  
  # Save Action 
  def save 
    Trip.create :name => params[:trip_name], :description => params[:trip_description], 
                :json => session[:yelp], :user_id => session.id
    session[:yelp] = nil
    redirect_to root_path
  end
  
  # Delete place from Trip 
  def delete 
    trip = session[:yelp]
    session[:yelp] = nil
    trip = trip.split(",") 
    trip.delete_at(params[:counter].to_i)
    trip.each do |trips|
      if session[:yelp] == nil
        session[:yelp] = trips
      else 
        session[:yelp] += "," + trips 
      end
    end
    redirect_to trips_itinerary_path
  end
  
  # Splitting the Cookies 
  def display_results
    yelp_id = session[:yelp].split(",")
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(trip_params)

    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render action: 'show', status: :created, location: @trip }
      else
        format.html { render action: 'new' }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:name, :description, :json, :user_id, :rating)
    end
end
