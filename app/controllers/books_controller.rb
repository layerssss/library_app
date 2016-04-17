# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  code       :string(255)
#  title      :string(255)
#  author     :string(255)
#  returned   :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy, :history]

  # GET /books
  def index
    like_exp = "%#{params[:keyword]}%"
    @books = Book.where("code like ? or title like ? or author like ?", like_exp, like_exp, like_exp)
  end

  # GET /books/1
  def show
    @loans = @book.loans.where(returned: false)
  end
  def history
    @loans = @book.loans.where(returned: true)
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def book_params
      params.require(:book).permit(:code, :title, :author)
    end
end
