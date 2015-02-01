module Domain
  # Repositories wrap existing data from the database in a domain object
  class GenreRepository
    def initialize(genre_class, genre_factory)
      @genre_class = genre_class
      @genre_factory = genre_factory
    end

    def find_by_id(id)
      record = @genre_class.where(id: id).includes(:books)
      raise ActiveRecord::RecordNotFound unless record.present?
      @genre_factory.create(record)
    end

    def limit(n)
      records = @genre_class.limit(n)

      wrap_domain_genres(records)
    end

    def all
      records = @genre_class.all

      wrap_domain_genres(records)
    end

    def for(book:)
      records = book.genres

      wrap_domain_genres(records)
    end

    private

    def wrap_domain_genres(records)
      records.map do |record|
        @genre_factory.create(record)
      end
    end
  end
end

