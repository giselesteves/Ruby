describe 'Busca rápida'  do
    #Método para selecionar as combos
    def seleciona_combo(id, valor, container)
        #Procura a combo pelo id e abre  
        container_combo = find(container)
        container_combo.click

        #Seleciona a opção desejada
        opcao_selecionada = find('div.css-fk865s-option', text: valor)
        opcao_selecionada.click
        sleep(3)
    end

    def obter_dados_prestadores(pagina, cidade_excluida)
        validacao_teste = false

        if pagina != '1' then
            first('a', :text => pagina).click            
            sleep(1)
        end

        #Lista todos os médicos de acordo com os filtros
        resultado_busca = all('div.DadosPrestador')        

        #Itera em todos os resultados encontrados
        resultado_busca.each do |el|
            #Verifica se a cidade e a especialidade estão de acordo nos resultados
            validacao_teste = !el.text.downcase.include?(cidade_excluida.downcase)

            #Se não encontrar os dados, retorna falso
            break if validacao_teste == false            

            #Escreve na tela os dados encontrados            
            puts el.text
            puts ""
        end

        return validacao_teste
    end

    it 'Realizar busca rápida por especialidade médica' do
        #Variáveis locais
        link_menu = "Guia Médico"
        especialidade = 'Dermatologia'        
        cidade = 'Rio de Janeiro'
        estado = 'Rio de Janeiro'
        lista_paginas = ["1", "2", "3"]
        cidade_excluida = 'São Paulo'
        resultado_teste = []

        #Unidades para teste
        UNIMED_RIO = '37'
        #CENTRAL_NACIONAL_UNIMED = '865'
        #UNIMED_LESTE_FLUMINENSE = '17'
        #UNIMED_MANAUS = '79'
        
        #Cria um Struct para a página e o respectivo status
        Resultado = Struct.new(:pagina, :status)

        #Acessa a página da UNIMED
        visit "https://www.unimed.coop.br/"

        #Confirma se a página está OK
        expect(page.title).to eql "Portal Nacional de Saúde - Unimed - Institucional"

        #Procura o link Guia Médico e clica no link
        click_link(link_menu)
       
        #Preencher o campo pesquisa com a especialidade
        fill_in 'pesquisa', with: especialidade
        
        #Clique no botão pesquisar
        click_button 'btn_pesquisar'

        #Aguarda tela carregar
        expect(find('#texto_selecione_unimed').visible?).to be true
        expect(find('#texto_selecione_unimed')).to have_content 'Selecione o estado e a cidade para localizar a Unimed onde você deseja ser atendido:'

        #combo de Estado
        seleciona_combo('react-select-2-input', estado, 'div.selecione-rede')

        #combo de Cidade
        seleciona_combo('react-select-3-input', cidade, 'div.selecione-plano')

        #Aguarda carregar o radio button
        expect(page.first('div', text: 'Essa região é atendida pelas Unimeds abaixo. Selecione a de sua preferência:').visible?).to be true

        #Clica no radio button
        choose(option: UNIMED_RIO)

        #Clica no botão Continuar
        click_button('Continuar')
        
        #Itera cada página
        lista_paginas.each do |pagina|
            item = Resultado.new
            item.pagina = pagina
            item.status = obter_dados_prestadores(pagina, cidade_excluida)
            resultado_teste.push(item)
        end

        #Verifica se São Paulo foi encontrada em alguma página
        array_resultado = resultado_teste.select { |item| item.status == false }        
        
        #Caso retorne 0 ocorrências da cidade de São Paulo, o teste passou
        #Valida resultado do teste
        expect(array_resultado.empty?).to be true
        sleep(10)
    end
end