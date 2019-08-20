class SubscribersController < ApplicationController
  def create
    @library = Library.find(params[:library_id])
    @subscriber = @library.subscribers.create(subscriber_params)
    redirect_to library_path(@library)
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
