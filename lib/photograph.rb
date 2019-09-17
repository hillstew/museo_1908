class Photograph
  attr_reader :id, :name, :artist_id, :year

  def initialize(data)
    @id = data[:id] || data["id"]
    @name = data[:name] || data["name"]
    @artist_id = data[:artist_id] || data["artist_id"].to_s
    @year = data[:year] || data["year"]
  end
end
