class ArtistsController < ApplicationController
  def index
    artist_grouped = Artist.joins(:plays).group(:name).count
    artist_prep = []
    artist_grouped.each do |k,v|
      artist_prep.push({name: k, weight: v})
    end
    render json:artist_prep
  end

  def show
    params
    begin
      titles_grouped = Title.joins(:plays, :artist).where("artist.slug":params[:id]).group(:name).count
      if !titles_grouped.empty?
        artist = Artist.find_by slug:params[:id]
        title_prep = []
        titles_grouped.each do |k,v|
          title_prep.push({name: k, weight: v})
        end

        artist_titles = {}
        artist_titles["name"] = artist.name
        artist_titles["plays"] = title_prep
        render json: artist_titles
      else
        redirect_to '/'
      end
    rescue ActiveRecord::RecordNotFound => e
      puts e
    end
  end
end


# begin
#   my_record = Record.find params[:id]
# rescue ActiveRecord::RecordNotFound => e
#   my_record = nil
# end
