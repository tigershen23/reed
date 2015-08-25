module Domain
  class BookPresenter
    RATINGS_RANGE = 1..5

    def initialize(books, genres)
      @books = Array(books)
      @genres = genres
    end

    attr_reader :books, :genres

    def amazon_image_url(amazon_id)
      "http://images.amazon.com/images/P/#{amazon_id}.01.ZTZZZZZZ.jpg"
    end
  end
end


