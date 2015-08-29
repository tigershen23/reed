class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update]

  def index
    genres = domain_factory.genre_repository.all
    @presenter = domain_factory.book_presenter(_books, genres: genres)
  end

  def show
  end

  def new
    book = domain_factory.book_factory.create(Book.new)
    @presenter = domain_factory.book_presenter(book, genres: domain_factory.genre_repository.all)

    respond_to do |format|
      format.js
    end
  end

  def edit
    book = domain_factory.book_repository.find_by_id(params[:id])
    @presenter = domain_factory.book_presenter(book, genres: domain_factory.genre_repository.all)

    respond_to do |format|
      format.js
    end
  end

  def create
    record = domain_factory.book_class.new(book_params)
    book = domain_factory.book_factory.create_for(record, current_reader)
    @presenter = domain_factory.book_presenter(_books)

    respond_to do |format|
      if domain_factory.book_repository.persist(book)
        format.json { render :show, status: :created, location: @book }
        format.js
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    book = domain_factory.book_repository.find_by_id(params[:id])
    @presenter = domain_factory.book_presenter(_books)
    puts "FART"

    respond_to do |format|
      if domain_factory.book_repository.update(book, book_params)
        format.js
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    book_repository = domain_factory.book_repository
    book = book_repository.find_by_id(params[:id])
    book_repository.destroy(book)

    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  def _books
    books = domain_factory.book_repository.search_and_filter_for_reader(
                                            current_reader.id,
                                            keyword: params[:keyword],
                                            genre_name: params[:filter]
                                          )
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :author, :description, :amazon_id, :rating, :finished_on, { genre_ids: [] })
    end
end
