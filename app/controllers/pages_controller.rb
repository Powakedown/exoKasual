class PagesController < ApplicationController
  def home; end

  def bars_map
    @query = params[:query] ? params[:query][:business] : session[:query]
    session[:query] = @query
    @bars = search(@query)
    @markersLatLng = @bars["businesses"].map { |bar| [bar["coordinates"]["latitude"],bar["coordinates"]["longitude"]]}
  end

  def bars_list
    @query = session[:query]
    @bars = search(@query)["businesses"]
  end

  def search(term)
    # url = "https://api.yelp.com/v3/businesses/search"
    url = "https://api.yelp.com/v3/businesses/search"

    params = {
      term: term,
      location: "Bordeaux",
      limit: 15,
    }

    response = HTTP.auth("Bearer #{ENV['YELP_API_KEY']}").get(url, params: params)
    response.parse
  end

  def update_details
    @bar = params
  end
end
