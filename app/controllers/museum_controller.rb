require 'json'
require 'open-uri'
require 'net/http'
class MuseumController < ApplicationController
  def index

    lat = params[:latitude].to_f
    lon = params[:longitude].to_f
    # radius = 5 # Define your desired radius
    # raise
    if lat != 0.0  || lon != 0.0
      url = "https://api.mapbox.com/geocoding/v5/mapbox.places/museums.json?proximity=#{lon},#{lat}&access_token=#{ENV['MAPBOX_API_KEY']}"
      # url_serialized = URI.parse(@url).open.read
      # @museums = JSON.parse(url_serialized)["features"]

      uri = URI(url)
      response = Net::HTTP.get(uri)
      @museums = JSON.parse(response)["features"]
    end
  end
end
