class SubscribersController < ApplicationController
  def create
    @library = Library.find(params[:library_id])
    @subscriber = @library.subscribers.create(subscriber_params)
    if @subscriber.save
      redirect_to library_path(@library)
    else render inline: "<div>
        <h2>Возникли ошибки! Список условий для успешного сохранения абонента:</h2>
        <ul>
          <li>Номер билета не может быть пустым;</li>
          <li>Фамилия абонента не может быть пустой;</li>
          <li>Имя абонента не может быть пустым;</li>
          <li>Адрес абонента не может быть пустым.</li>
        </ul>
        <h2>Попробуйте еще раз</h2>
        <%= link_to 'Назад', library_path(@library) %>
      </div>"
    end
  end

  def show
    @subscriber =  Subscriber.find(params[:id])
  end

  def edit
    @subscriber =  Subscriber.find(params[:id])
  end

  def update
    @subscriber =  Subscriber.find(params[:id])
    if @subscriber.update(subscriber_params)
        redirect_to library_path(Library.find(@subscriber.library_id))
    else
      render action: :edit
    end
  end

  def destroy
    @subscriber = Subscriber.find(params[:id])
    @library = Library.find(@subscriber.library_id)
    @subscriber.destroy
    redirect_to library_path(@library)
  end

private
  def subscriber_params
    params.require(:subscriber).permit(:ticketnumber, :surname, :name, :middleName, :address, :phone)
  end
end
