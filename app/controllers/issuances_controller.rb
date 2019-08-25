class IssuancesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @issuance = @book.issuances.create(issuance_params)
    if @issuance.save
      redirect_to book_path(@book)
    else render inline: "<div>
        <h2>Возникли ошибки! Список условий для успешного сохранения выдачи:</h2>
        <ul>
          <li>Абонент не может быть пустым;</li>
          <li>Дата возврата должна не раньше даты выдачи;</li>
          <li>Дата выдачи должна быть не раньше даты возвращения книги.</li>
        </ul>
        <h2>Попробуйте еще раз</h2>
        <%= link_to 'Назад', book_path(@book) %>
      </div>"
    end
  end

  def edit
    @issuance =  Issuance.find(params[:id])
  end

  def update
    @issuance =  Issuance.find(params[:id])
    if @issuance.update(issuance_params)
        redirect_to subscriber_path(Subscriber.find(@issuance.subscriber_id))
    else
      render action: :edit
    end
  end

  def destroy
    @issuance = Issuance.find(params[:id])
    @book = Book.find(@issuance.book_id)
    @issuance.destroy
    redirect_to book_path(@book)
  end

  private
    def issuance_params
      params.require(:issuance).permit( :subscriber_id, :issueDate, :returnDate)
    end

end
