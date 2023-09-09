class Movies
  Entity = Struct.new(:id, :title, :year, :director)

  @movies =
    [
      Entity.new(id: 1, title: "The Shawshank Redemption", year: 1994, director: "Frank Darabont"),
      Entity.new(id: 2, title: "The Godfather", year: 1972, director: "Francis Ford Coppola"),
      Entity.new(id: 3, title: "The Dark Knight", year: 2008, director: "Christopher Nolan")
    ]

  def self.all
    @movies
  end
end
