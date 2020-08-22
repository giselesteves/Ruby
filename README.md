# Exercícios

Objetivo: 
* Praticar automatização de testes Web e API em Ruby.

## Exercício 1 
Criar um projeto de automação utilizando BDD e em linguagem de programação de sua preferência os cenários para as duas funcionalidades abaixo: 
1. No site https://www.unimed.coop.br/ validar a seguinte sequência de ações: 
  * Acessar Guia Médico 
  * Realizar uma pesquisa de médicos no Rio de Janeiro. (Busca rápida) 
  * Validar a apresentação dos resultados com a Especialidade e Cidade 

2. No mesmo site, validar: 
  * Acessar Guia Médico 
  * Realizar uma pesquisa de médicos no Rio de Janeiro. 
  * Validar nas páginas 1, 2, e 3 do resultado, NÃO apresentação dos resultados com cidade São Paulo 

## Exercício 2 
Criar um projeto de automação para API utilizando framework de sua preferência os cenários para as duas funcionalidades abaixo: 
* EndPoint: http://www.omdbapi.com/?i=[ID_DO_FILME]&apikey=[API_KEY]
* Parâmetros:
  * ID_DO_FILME: tt1285016
  * API_KEY= 52ec71bf 

1. No endpoint validar o response para: 
  * Titulo do Filme 
  * Ano do Filme 
  * Idioma do filme 

2. No endpoint validar o response para:
  * Busca filme inexistente
