class PagesController < ApplicationController
  def home; end

  def bars
    query = params[:query][:business]
    console
  end
end
