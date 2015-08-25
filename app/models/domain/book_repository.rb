module Domain
  # Repositories wrap existing data from the database in a domain object
  class BookRepository
    def initialize(book_class, book_factory)
      @book_class = book_class
      @book_factory = book_factory
    end

    def persist(book)
      book.set_keywords
      book.send(:record).save!
    end

    def update(book, params)
      puts book.description
      book.assign_attributes(params)
      persist(book)
      puts book.send(:record).reload.description
      book
    end

    def destroy(book)
      @book_class.destroy(book.id)
    end

    def find_by_id(id)
      record = @book_class.where(id: id).includes(:genres).first
      raise Domain::RecordNotFound unless record.present?
      @book_factory.create(record)
    end

    def search_and_filter_for_reader(reader_id, keyword: nil, genre_name: nil)
      records = @book_class.for_reader(reader_id).search(keyword).filter(genre_name).order("created_at DESC")

      wrap_domain_books(records)
    end

    def search_and_filter(keyword: nil, genre_name: nil)
      book_records = @book_class.search(keyword).filter(genre_name).order("created_at DESC")

      book_records.map do |record|
        @book_factory.create(record)
      end
    end

    def for(genre:)
      genre.books.map do |book|
        @book_factory.create(book)
      end
    end

    def wrap_domain_books(records)
      records.map do |record|
        @book_factory.create(record)
      end
    end
  end
end
