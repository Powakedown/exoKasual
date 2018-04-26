class PagesController < ApplicationController
  def home; end

  def bars
    query = params[:query][:business]
    search(query)
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
    barsArray = response.parse

    @barsGeoloc = barsArray["businesses"].map { |bar| [bar["coordinates"]["latitude"],bar["coordinates"]["longitude"]]}

  end
end
