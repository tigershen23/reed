class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update]

  def index
    books = domain_factory.book_repository.search_and_filter_for_reader(
                                            current_reader.id,
                                            keyword: params[:keyword],
                                            genre_name: params[:filter]
                                          )
    genres = domain_factory.genre_repository.all
    @presenter = domain_factory.book_presenter(books, genres)
  end

  def show
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    record = domain_factory.book_class.new(book_params)
    book = domain_factory.book_factory.create_for(record, current_reader)
    @presenter = domain_factory.book_presenter([book], nil)

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
    @presenter = domain_factory.book_presenter(book, nil)

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

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :author, :description, :amazon_id, :rating, :finished_on, { genre_id: [] })
    end
end
