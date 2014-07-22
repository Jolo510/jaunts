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
      session[:yelp] = params[:yelp_save_id]
    else 
      session[:yelp] += "," + params[:yelp_save_id]
    end 
    params[:yelp_image] = params[:yelp_save_image]
    redirect_to businesses_save_path(yelpId: params[:yelp_save_id], yelpImage: params[:yelp_save_image])
    end 

end 
    
