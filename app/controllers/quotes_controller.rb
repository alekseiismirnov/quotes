class QuotesController < ApplicationController
  def index
    @quotes = Quote.all
    json_responce @quotes
  end

  def show
    @quote = Quote.find params[:id]
    json_responce @quote
  end

  def create
    @quote = Quote.create!(quote_params)
    json_responce @quote
  end

  def update
    @quote = Quote.find params[:id]
    @quote.update quote_params
  end

  def destroy
    @quote = Quote.find params[:id]
    @quote.destroy
  end

  private 
  def json_responce(object, status = :ok)
    render json: object, status: status
  end

  def quote_params
    params.require(:quote).permit(:author, :content)
  end
end
