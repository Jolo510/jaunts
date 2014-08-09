class YelpController < ApplicationController
  skip_before_action :authorize 
  
  # Sends a request to the yelp database to get search results 
  def yelp_search(place, location)
    params = { term: place,
               limit: 12
             }
    locale = { lang: 'en' }
    response = Yelp.client.search(location, params, locale)
  end
  
  # Saves the place user wants to add in the cookies 
  def set_cookie 
    if session[:yelp] == nil
      session[:yelp] = params[:yelp_save_id]
    else 
      session[:yelp] += "," + params[:yelp_save_id]
    end 
   
    redirect_to businesses_save_path(yelpId: params[:yelp_save_id], yelpName: params[:yelp_save_name], yelpImage: params[:yelp_save_image],
    yelpCount: params[:yelp_save_count], yelpRating: params[:yelp_save_rating], yelpSnippet: params[:yelp_save_snippet], yelpAddress: params[:yelp_save_address], yelpCity: params[:yelp_save_city],
    yelpState: params[:yelp_save_state], yelpPostal: params[:yelp_save_postal], yelpUrl: params[:yelp_url]); 
    
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

end 
    
