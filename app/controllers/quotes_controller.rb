class QuotesController < ApplicationController
  def index
    @quotes = {quotation: 'The secret of getting ahead is getting started.'}
    json_responce @quotes
  end

  private 
  def json_responce(object, status = :ok)
    render json: object, status: status
  end
end
