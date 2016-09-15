require 'rspotify'

class PlayerController < ApplicationController

  def index
    RSpotify.authenticate('f6acf8947aa84d2b8266e571f344333d', '0a3da0d97956457cbc1e522667d89c14')
  end

  def search
    get_search_results(params[:playlist_search])
    render 'player/results'
  end

  def get_search_results(playlist_search)
    RSpotify.authenticate('f6acf8947aa84d2b8266e571f344333d', '0a3da0d97956457cbc1e522667d89c14')

    playlists = RSpotify::Playlist.search(playlist_search)

    playlists.each do | playlist |
      matches_search = playlist.name.include? 'Todays Top Hits'
      if matches_search
        get_playlist_url(playlist)
      end
    end
  end

  def get_playlist_url(playlist)
    tracks = playlist.tracks
    list_of_track_uris = shuffle(get_uris(tracks))

    playlist_url = 'https://embed.spotify.com/?uri=spotify:trackset:PREFEREDTITLE:'

    list_of_track_uris.each do |trackUri|
      playlist_url += trackUri + ','
    end

    @url = playlist_url
  end

  def get_uris(list_of_tracks)
    list_of_uris = []
    list_of_tracks.each do |track|
      track_uri = track.uri[/((?<=track:)([^\n\r]*))/]
      list_of_uris.push(track_uri)
    end
    list_of_uris
  end

  def shuffle(list)
    list.shuffle
  end

end