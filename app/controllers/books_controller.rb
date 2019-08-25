class BooksController < ApplicationController
  def create
    @library = Library.find(params[:library_id])
    @book = @library.books.create(book_params)
    if @book.save
      redirect_to library_path(@library)
    else render inline: "<div>
        <h2>Возникли ошибки! Список условий для успешного сохранения книги:</h2>
        <ul>
          <li>Название книги не может быть пустым;</li>
          <li>Автор книги не может быть пустым;</li>
          <li>Вес изображения обложки не должен превышать 1 MB;</li>
          <li>Издательство не может быть пустым;</li>
          <li>Цена книги не может быть пустой.</li>
        </ul>
        <h2>Попробуйте еще раз</h2>
        <%= link_to 'Назад', library_path(@library) %>
      </div>"
    end
  end

  #use for "Top 10 books"
  def index
    @library = Library.find(params[:library_id])
    @books_all = Book.where(library_id: @library.id)
    @issuances = Issuance.group(:book_id).count.sort{|b,a| a[1]<=>b[1]}
    @books = Array.new
    @count = 0
    @issuances.each do |iss|
      if @books_all.include?(Book.find(iss[0]))
        @books.push(@books_all.find(iss[0]))
        @count = @count + 1
      end
      if @count == 10
        break
      end
    end
  end

  def show
    @book =  Book.find(params[:id])
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
