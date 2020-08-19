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

    it 'Realizar busca rápida por especialidade médica' do
        #Variáveis locais
        link_menu = "Guia Médico"
        especialidade = 'Dermatologia'        
        cidade = 'Rio de Janeiro'
        estado = 'Rio de Janeiro'
        resultado_teste = true

        #Unidades para teste
        UNIMED_RIO = '37'

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
        expect(first('div', text: 'Essa região é atendida pelas Unimeds abaixo. Selecione a de sua preferência:').visible?).to be true

        #Clica no radio button
        choose(option: UNIMED_RIO)

        #Clica no botão Continuar
        click_button('Continuar')
        
        #Lista todos os médicos de acordo com os filtros
        resultado_busca = all('div.DadosPrestador')        

        #Itera em todos os resultados encontrados
        resultado_busca.each do |el|
            #Verifica se a cidade e a especialidade estão de acordo nos resultados
            resultado_teste = el.text.downcase.include?(cidade.downcase) && el.text.downcase.include?(especialidade.downcase)

            #Se não encontrar os dados, retorna falso
            break if resultado_teste == false            

            #Escreve na tela os dados encontrados            
            puts el.text
            puts ""
        end

        #Valida resultado do teste
        expect(resultado_teste).to be true
    end
end