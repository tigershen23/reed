module Domain
  class SampleBook
    SAMPLE_TITLE = "The Hobbit"
    SAMPLE_AUTHOR = "J.R.R. Tolkien"
    SAMPLE_DESCRIPTION = <<-HOBBIT
                    This introduction to the hobbit Bilbo Baggins, the wizard Gandalf, Gollum, and the spectacular world
                    of Middle-earth recounts of the adventures of a reluctant hero, a powerful and dangerous ring, and
                    the cruel dragon Smaug the Magnificent.
                         HOBBIT
    SAMPLE_AMAZON_ID = "061815082X"
    SAMPLE_RATING = 5
    SAMPLE_GENRES = [6, 7]

    SAMPLE_BOOK = {
                    title: SAMPLE_TITLE,
                    author: SAMPLE_AUTHOR,
                    description: SAMPLE_DESCRIPTION,
                    amazon_id: SAMPLE_AMAZON_ID,
                    rating: SAMPLE_RATING,
                    genre_ids: SAMPLE_GENRES
                  }

    def initialize(book_class, book_factory, book_repository)
      @book_class = book_class
      @book_factory = book_factory
      @book_repository = book_repository
    end

    def for_reader(reader)
      record = @book_class.new(SAMPLE_BOOK)
      book = @book_factory.create_for(record, reader)
      @book_repository.persist(book)
      book
    end
  end
end
