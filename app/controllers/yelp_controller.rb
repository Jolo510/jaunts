class YelpController < ApplicationController
  
  def yelp_search(place, location)
    params = { term: place,
               limit: 12
             }
    locale = { lang: 'en' }
    response = Yelp.client.search(location, params, locale)
  end
  
  def set_cookie 
    if session[:yelp] == nil
      session[:yelp] = params[:yelp_id]
    else 
      session[:yelp] += "," + params[:yelp_id]
    end 
    
    redirect_to trips_itinerary_path
    end 

end 
    
