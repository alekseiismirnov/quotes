class Api::V1::QuotesController < ApplicationController
  def index
    if params[:name]
      @quotes = Quote.where(author: params[:name])
    else
      @quotes = Quote.all
    end

    json_response @quotes
  end

  def show
    @quote = Quote.find params[:id]
    json_response @quote
  end

  def create
    if @quote = Quote.create!(quote_params)
      json_response( @quote, :created )
    end
  end

  def update
    @quote = Quote.find params[:id]
    if @quote.update! quote_params
      json_response( {message: 'Quote updated successfuly'} )
    end
  end

  def destroy
    @quote = Quote.find params[:id]
    if @quote.destroy
      json_response( {message: 'Quote deleted'} )
    end
  end

  private 

  def quote_params
    params.require(:quote).permit(:author, :content)
  end
end
