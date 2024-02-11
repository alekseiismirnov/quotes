require 'rails_helper'

describe 'Search by the author' do
  before :all do 
    @quotes = create_list(:quote, 20)
    @author_name = "b7HkJ6x UG3nqcejmzbv"
    @quotes_number = 15
    @his_quotes = create_list(:quote, @quotes_number, author: @author_name)
  end

  it 'returns all authors quotes' do
    get "/quotes?name=#{@author_name}"

    expect(response).to have_http_status :ok
    expect(JSON.parse(response.body).length).to eq @quotes_number
  end

  
end
