require 'httparty'

RSpec.describe 'Validar filme inexistente' do
  it 'Deve retornar false para a request valida' do
    #Parâmetros querystring
    query =  {
      "i" => "tt12850160",
      "apikey" => "52ec71bf"
    }

    #Chamada da api
    response = HttParty.get('/', :query => query)

    #Validação do response
    expect(response["Response"].to_s.downcase).to eql('false')
  end  
end

RSpec.describe 'Validar response' do
  it 'Validação de titulo, ano e idioma do filme' do
    #Parâmetros querystring
    query =  {
      "i" => "tt1285016",
      "apikey" => "52ec71bf"
    }
    #Chamada da api
    response = HttParty.get('/', :query => query)

    #Validação do response
    expect(response["Title"].to_s.downcase).to eq('the social network')
    expect(response["Year"].to_s.downcase).to eq('2010')
    expect(response["Language"].to_s.downcase).to eq('english, french')
  end
end

RSpec.describe 'Validar schema' do
  it 'Deve retornar as tipagens' do
    #Parâmetros querystring
    query =  {
      "i" => "tt1285016",
      "apikey" => "52ec71bf"
    }
    #Chamada da api
    response = HttParty.get('/', :query => query)

    #Validação do response
    expect(response["Title"]).to be_a_kind_of(String)
    expect(response["Year"]).to be_a_kind_of(String)
    expect(response["Language"]).to be_a_kind_of(String)
  end
end