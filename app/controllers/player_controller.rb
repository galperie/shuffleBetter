require 'rspotify'

class PlayerController < ApplicationController

  def index
    playlists = RSpotify::Playlist.search('Top Hits')
    songs = []

    playlists.each do |playlist|
      include=playlist.name.include? "Todays Top Hits"
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
