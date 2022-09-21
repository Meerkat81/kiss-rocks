class ArtistsController < ApplicationController
  def index
    artist_grouped = Artist.joins(:plays).group(:name).count
    artist_prep = []
    artist_grouped.each do |k,v|
      artist_prep.push({name: k, weight: v})
    end
    render json:artist_prep
  end
end
