module Domain
  # This class is responsible for instantiating domain objects with their dependencies
  class DomainFactory
    # REPOSITORIES
    def book_repository
      Domain::BookRepository.new(book_class, book_factory)
    end

    def genre_repository
      Domain::GenreRepository.new(genre_class, genre_factory)
    end

    # FACTORIES
    def book_factory
      Domain::BookFactory.new
    end

    def genre_factory
      Domain::GenreFactory.new
    end

    # PRESENTERS
    def book_presenter(books, options={})
      Domain::BookPresenter.new(books, options)
    end

    # MODEL CLASS NAMES
    def genre_class
      ::Genre
    end

    def book_class
      ::Book
    end

    # MISC
    def sample_book
      Domain::SampleBook.new(book_class, book_factory, book_repository)
    end
  end
end

