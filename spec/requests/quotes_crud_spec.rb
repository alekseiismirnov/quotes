require 'rails_helper'

describe 'Basic CRUD functionality' do
  before :all do
    @quotes = create_list(:quote, 20)  
  end

  it 'retrive all quotes' do
    get '/quotes'
    expect(JSON.parse(response.body).size).to eq @quotes.size
  end

  it 'allow to retrive a quote' do
    quote = @quotes[5]
    get "/quotes/#{quote.id}"
    expect(response).to have_http_status :ok
    expect(JSON.parse(response.body)['author']).to eq quote[:author]
    expect(JSON.parse(response.body)['content']).to eq quote[:content]
  end
 
  it 'allow to add new quote' do
    post(
      '/quotes',
      params:
        { quote:
          { author: 'Who',
            content: 'cares' }}
    )
    expect(response).to have_http_status :created    
  end
  # TODO update and delete
end

