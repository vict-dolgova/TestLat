class IssuancesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @issuance = @book.issuances.create(issuance_params)
    redirect_to book_path(@book)
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
