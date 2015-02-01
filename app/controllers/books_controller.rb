class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update]

  # GET /books
  # GET /books.json
  def index
    books = domain_factory.book_repository.search_and_filter_for_reader(
                                            current_reader.id,
                                            keyword: params[:keyword],
                                            genre_name: params[:filter]
                                          )
    genres = domain_factory.genre_repository.all
    @presenter = domain_factory.book_presenter(books, genres)
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    record = domain_factory.book_class.new(book_params)
    book = domain_factory.book_factory.create_for(record, current_reader)
    @presenter = domain_factory.book_presenter([book], nil)

    respond_to do |format|
      if domain_factory.book_repository.persist(book)
        # format.html { redirect_to book_url(book.id), notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
        format.js
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
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
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :author, :description, :amazon_id, :rating, :finished_on, { genre_id: [] })
    end
end
