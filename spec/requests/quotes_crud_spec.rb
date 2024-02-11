require 'rails_helper'

describe 'Basic CRUD functionality' do
  before :all do
    @quotes = create_list(:quote, 20)  
    @quote_delete = @quotes[10]
    @quote_update = @quotes[12]
  end

  it 'retrive all quotes' do
    get quotes_path
    expect(JSON.parse(response.body).size).to eq @quotes.size
  end

  it 'allow to retrive a quote' do
    quote = @quotes[5]
    get quote_path(quote)

    expect(response).to have_http_status :ok
    expect(JSON.parse(response.body)['author']).to eq quote[:author]
    expect(JSON.parse(response.body)['content']).to eq quote[:content]
  end
 
  it 'allow to add new quote' do
    post(
      quotes_path,
      params:
        { quote:
          { author: 'Who',
            content: 'cares' }}
    )
    expect(response).to have_http_status :created    
  end

  it 'allows to delete existing quote' do
    delete quote_path(@quote_delete)

    expect(response).to have_http_status :ok       
    get quote_path(@quote_delete)
    expect(response).to have_http_status :not_found
  end


  it 'allows to update existing quote' do
    new_author = "$6$fw P. yHMirAfyjWKzG$R"
    new_content = "$6$huhlOfTBNjOnibgK$qhKDtpOJbrqFl12fFM4HDK58ZxVWQmdluIYDHYM9sbaL7EP11h6.ihtzrUIkY8cx513Eh9hDBFwSXPT5YC9WY1"

    patch(quote_path(@quote_update),
      params: 
      { quote:
          { author: new_author,
            content: new_content
          }
      })
    
    expect(response).to have_http_status :ok

    get quote_path(@quote_update)

    expect(response).to have_http_status :ok
    expect(JSON.parse(response.body)['author']).to eq new_author
    expect(JSON.parse(response.body)['content']).to eq new_content
  end
end

