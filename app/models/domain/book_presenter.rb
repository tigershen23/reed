module Domain
  class BookPresenter
    RATINGS_RANGE = 1..5

    def initialize(books, options = {})
      @books = Array(books)
      @genres = options[:genres] || []
    end

    attr_reader :books, :genres

    def book_record
      book.send(:record)
    end

    def book
      books.first
    end

    def amazon_image_url(amazon_id)
      "http://images.amazon.com/images/P/#{amazon_id}.01.ZTZZZZZZ.jpg"
    end
  end
end


