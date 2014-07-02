class YelpController < ApplicationController
  
  def yelp_search(place, location)
    params = { term: place,
               limit: 10
             }
    locale = { lang: 'en' }
    response = Yelp.client.search(location, params, locale)
  end
  
end
