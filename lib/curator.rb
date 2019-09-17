require 'csv'
require './lib/photograph'
require './lib/artist'

class Curator
  attr_reader :photographs,
              :artists

  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photo)
    @photographs << photo
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    @artists.find { |artist| artist.id == id }
  end

  def find_photograph_by_id(id)
    @photographs.find { |photo| photo.id == id }
  end

  def find_photographs_by_artist(artist)
    @photographs.select do |photo|
      photo.artist_id == artist.id
    end
  end

  def artists_with_multiple_photographs
    artist_ids = []
    artists = @photographs.group_by(&:artist_id)
    artists.each do |id, photos|
      artist_ids.push(find_artist_by_id(id)) if photos.length > 1
    end
    artist_ids
  end

  def photographs_taken_by_artist_from(country)
    @photographs.find_all do |photo|
      find_artist_by_id(photo.artist_id).country == country
    end
  end

  def load_photographs(file)
    CSV.foreach(file, :headers=> true) do |row|
      @photographs.push(Photograph.new(row))
    end
  end

  def load_artists(file)
    CSV.foreach(file, :headers=> true) do |row|
      @artists.push(Artist.new(row))
    end
  end

  def photographs_taken_between(range)
    @photographs.find_all do |photo|
      range.to_a.include? photo.year.to_i
    end
  end

  def artists_photographs_by_age(artist)
    photos_by_age = Hash.new
    find_photographs_by_artist(artist).each do |photo|
      photos_by_age[photo.year.to_i - artist.born.to_i] = photo.name
    end
    photos_by_age
  end
end
