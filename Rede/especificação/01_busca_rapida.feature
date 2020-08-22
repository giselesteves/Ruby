
#language: pt

Funcionalidade: Busca Rápida
Como um usuário
Quero acessar o portal Unimed
Para realizar uma busca rápida por especialidade médica e cidade

@01_busca_rapida
Cenário: Realizar busca rápida por dermatologia no Rio de Janeiro
Dado que acesso o menu "Guia Médico" no portal Unimed
E informo especialidade, Estado e Cidade
Quando clico em "Pesquisar"
Então valido uma lista de Dermatologistas da cidade do Rio de Janeiro
