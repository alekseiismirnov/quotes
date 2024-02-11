class QuotesController < ApplicationController
  def index
    if params[:name]
      @quotes = Quote.where(author: params[:name])
    else
      @quotes = Quote.all
    end

    json_responce @quotes
  end

  def show
    @quote = Quote.find params[:id]
    json_responce @quote
  end

  def create
    if @quote = Quote.create!(quote_params)
      render json: @quote, status: :created
    end
  end

  def update
    @quote = Quote.find params[:id]
    if @quote.update! quote_params  # TODO why doesn't json_response work?
      render json: {message: 'Quote updated successfuly'}, status: :ok
    end
  end

  def destroy
    @quote = Quote.find params[:id]
    if @quote.destroy
      render json: {message: 'Quote deleted'}
    end
  end

  private 
  def json_responce(object, status = :ok)
    render json: object, status: status
  end

  def quote_params
    params.require(:quote).permit(:author, :content)
  end
end
