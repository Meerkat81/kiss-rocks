response = HTTParty.get('https://lsp-prod.cmg.com/api/v3/histories/kissrocks.com/')

scheduler = Rufus::Scheduler.new
scheduler.every '5s' do
	puts "api called"
	response = HTTParty.get('https://lsp-prod.cmg.com/api/v3/histories/kissrocks.com/')
	response.each do |song|
		puts song.inspect
		if song['isSong']
		    artist = song['artist']
		    song_title = song['title']
		    kiss_time_stamp = song['timestamp']
		    kiss_id = song['id']

		    if !Artist.find_by slug: artist.parameterize
		      new_artist = Artist.new(
		          name: artist,
		          slug: artist.parameterize)
		      new_artist.save
		    end

		    if !Title.find_by slug: song_title.parameterize
		      title_artist = Artist.find_by slug: artist.parameterize
		      new_title = Title.new(
		        name: song_title,
		        artist_id: title_artist.id,
		        slug: song_title.parameterize)
		      new_title.save
		    end

		    added_play_artist = Artist.find_by slug: artist.parameterize
		    added_play_title = Title.find_by slug: song_title.parameterize

		    if !Play.find_by kiss_id: kiss_id
		    	new_play = Play.new(
			      title_id: added_play_title.id,
			      artist_id: added_play_artist.id,
			      kiss_id: kiss_id,
			      kiss_time_stamp: kiss_time_stamp)
		    	new_play.save
		    end
		end
	end
end
