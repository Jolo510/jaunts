class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize 

  # GET /businesses
  # GET /businesses.json
  def index
    @businesses = Business.all
  end

  # GET /businesses/1
  # GET /businesses/1.json
  def show
  end

  # GET /businesses/new
  def new
    @business = Business.new
  end

  # GET /businesses/1/edit
  def edit
  end
  
  def image
    image2 = Business.find_by yelp_id: params[:id]
    send_data(image2.image, :type => "image/png")
  end
  
  # Action that displays the yelp image from the database. Image stored as binary
  def display_image
    busObject  = Business.find_by yelp_id: (params[:yelpId])
    send_data( busObject.image , :type => "image/png")
  end
  
  # Action that displays the rating from the database 
  def display_rating
    busObject  = Business.find_by yelp_id: (params[:yelpId])
    send_data( busObject.rating_img , :type => "image/png")
  end
  
  def save 
    
    # If the yelp businesses is not in the database it will be added
    occur = Business.find_by yelp_id: params[:yelpId]
    if occur == nil
      # business image 
      bus_img = ""
      bus_img << open(params[:yelpImage].to_s).read
      rating_img = ""
      rating_img << open(params[:yelpRating].to_s).read 
      
      Business.create :yelp_id => params[:yelpId], :name => params[:yelpName], :image => bus_img, :review_count => params[:yelpCount],
                      :rating_img => rating_img, :snippet_text => params[:yelpSnippet], :location_address => params[:yelpAddress], :location_city => params[:yelpCity],
                      :location_state => params[:yelpState], :location_postal => params[:yelpPostal], :url => params[:yelpUrl]
    end 
    redirect_to trips_itinerary_path
  end

  # POST /businesses
  # POST /businesses.json
  def create
    @business = Business.new(business_params)

    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Business was successfully created.' }
        format.json { render action: 'show', status: :created, location: @business }
      else
        format.html { render action: 'new' }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /businesses/1
  # PATCH/PUT /businesses/1.json
  def update
    respond_to do |format|
      if @business.update(business_params)
        format.html { redirect_to @business, notice: 'Business was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /businesses/1
  # DELETE /businesses/1.json
  def destroy
    @business.destroy
    respond_to do |format|
      format.html { redirect_to businesses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_params
      params.require(:business).permit(:yelp_id, :name, :image, :display_phone, :review_count, :rating_img, :snippet_text, :location_address, :location_city, :location_state, :location_postal, :url)
    end
end
