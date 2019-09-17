class Artist
  attr_reader :id,
              :name,
              :born,
              :died,
              :country

  def initialize(data)
    @id = data[:id] || data["id"]
    @name = data[:name]|| data["name"]
    @born = data[:born]|| data["born"]
    @died = data[:died]|| data["died"]
    @country = data[:country]|| data["country"]
  end
end
