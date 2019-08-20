class BooksController < ApplicationController
  def create
    @library = Library.find(params[:library_id])
    @book = @library.books.create(book_params)
    redirect_to library_path(@library)
  end

  def edit
    @book =  Book.find(params[:id])
  end

  def update
    @book =  Book.find(params[:id])
    if @book.update(book_params)
        redirect_to library_path(Library.find(@book.library_id))
    else
      render action: :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @library = Library.find(@book.library_id)
    @book.destroy
    redirect_to library_path(@library)
  end

  private
    def book_params
      params.require(:book).permit(:name, :author, :cipher, :cover, :publishingHouse, :publishingYear, :price, :receiptDate)
    end
end
