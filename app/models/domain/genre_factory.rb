module Domain
  # Factories instantiate domain objects
  class GenreFactory
    def create(record)
      Domain::Genre.new(record)
    end
  end
end

