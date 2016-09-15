require 'rspotify'

class PlayerController < ApplicationController

  def index
    RSpotify.authenticate('f6acf8947aa84d2b8266e571f344333d', '0a3da0d97956457cbc1e522667d89c14')
  end

  def search
    results
    render 'player/results'
  end

  def results
    RSpotify.authenticate('f6acf8947aa84d2b8266e571f344333d', '0a3da0d97956457cbc1e522667d89c14')
    playlists = RSpotify::Playlist.search('Top Hits')

    shuffle(playlists)

    playlists.each do |playlist|
      include=playlist.name.include? 'Todays Top Hits'
      if (include)
        @url = 'https://embed.spotify.com/?uri=' + playlist.uri
      end
    end
  end

  def shuffle(list)
    puts 'BEFORE ******************************'
    puts list
    list = list.shuffle
    puts 'AFTER ******************************'
    puts list
    list
  end

end