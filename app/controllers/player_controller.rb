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
    puts 'HERE ********************************'
    playlists = RSpotify::Playlist.search('Top Hits')
    songs = []

    playlists.each do |playlist|
      include=playlist.name.include? 'Todays Top Hits'
      if(include)
        puts playlist.name

        tracks = playlist.tracks
        tracks.each do |track|
          artistsString = ''
          track.artists.each do |artist|
            artistsString += artist.name + ' '
          end

          songs.push(track.name + ' - ' + artistsString)
        end
      end
    end
    @songs = songs
  end

end
