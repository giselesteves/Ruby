## Implementação de testes para Web utilizando RUBY + CAPYBARA + RSPEC

## Estrutura do projeto:

* A pasta principal é a `Web` e dentro dela temos a pasta `specs` contendo as `features` e os `scripts` de teste
* `spec_helper` arquivo de configuração
* `gemfile` arquivo com as dependências do projeto

## Pré requisitos para rodar local:

* Instalação do Ruby: https://rubyinstaller.org/
* Realizar o download do Geckodrive em https://github.com/mozilla/geckodriver/releases/download/v0.27.0/geckodriver-v0.27.0-win64.zip e extrair o arquivo zip, colocando o executável na pasta C:\Windows
* Instalação do Capybara usando o comando: `gem install capybara`
* Instalar o Bundler na raiz do projeto com o comando: `gem install bundler`
* Executar na raiz do projeto o comando: `gem install bundler`
* Executar na raiz do projeto o comando: `bundle install`
* Iniciar o RSpec na raiz do projeto com o comando: `rspec init`

## Passos para rodar os testes:

* Entrar pelo terminal na pasta Web
* Usar o comando: `rspec  ./spec/NOME-DO-ARQUIVO-RUBY.rb` 
