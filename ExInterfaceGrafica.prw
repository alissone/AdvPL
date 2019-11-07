#include "Protheus.Ch"
#Include "Topconn.Ch"

/*/{Protheus.doc} User Function ExConPad
	Snippet de exemplo de consulta padrão em uma tabela do sistema,
    a qual deve obrigatoriamente estar presente na SX3. Abre uma caixa de
    pesquisa listando itens da tabela, com busca e filtros. Ao selecionar
	uma opção, este posiciona automaticamente no registro que voce selecionou

	@type User Function
	@author  Alisson Amorim / alisson@email.com
	@since 14/08/2019
/*/
User Function ExConPad()
	lClicouOk := ConPad1(,,,"SE1")
	MsgInfo(SE1->E1_NOMCLI)

Return Nil

/*/{Protheus.doc} User Function ExMbrw
	Snippet de exemplo de do MBrowse para visualização em Grid com botões customizados

	@type User Function
	@author Alisson Amorim / alisson@email.com
	@since 02/10/2019
/*/
User Function ExMbrw()
	Private cCadastro := "Titulo"
	Private aRotina := {{"Pesquisar" , "axPesqui" , 0, 1},;
		{"Visualizar", "U_ModGtd" , 0, 2},;
		{"Incluir"   , "U_ModGtd" , 0, 3}}

	DbSelectArea("SC5")
	DbSetOrder(1)

	MBrowse(6,1,22,75,"SC5")

Return

/*/{Protheus.doc} User Function ArrIncl
	Inclui o valor xVal no array aArr e retorna .T.
	se o valor foi incluido ou .F. se ja existia antes

	@type User Function
	@author Alisson Amorim / alisson@email.com
	@since 02/10/2019
/*/

User Function ArrIncl(aVetor, xVal)
	Local nPos := aScan(aVetor, xVal)
	If nPos = 0
		Aadd(aVetor, xVal)
		Return .T.
	Else
		Return .F.
	EndIf
Return Nil

User Function ExArrIn()
	Local aVetor := { "Java", "AdvPL", "C++" }

	lRet := ArrIncl(aVetor, "Java")

	AEval(aVetor,{ | x | Alert(x) })
	MsgInfo(lRet)

Return Nil

/*/{Protheus.doc} User Function ExModelo2
	Snippet de exemplo de caixa de busca Modelo2
	com a tabela SE1

	@type User Function
	@author Alisson Amorim / alisson@email.com
	@since 22/07/2019
/*/

User Function ExModelo2()

	Local cTitulo     := "Titulo"
	Local aCab        := {}
	Local aCGD        := {44,5,118,315}
	Private aCols     := {}
	Private aColsR    := {}
	Private aCriaCols := {}
	Private aHeader   := {}
	Private _cChave   := ""
	Private _cDescri  := ""

	aHeader   := aClone( APBuildHeader("SE1") )
	aCriaCols := aClone( A610CriaCols( "SE1", aHeader, , {|| .F.}) )
	aCols     := aClone( aCriaCols[1] )
	aColsR    := aClone( aCriaCols[2] )

	AAdd(aCab,{"_cChave" ,{15,10} ,"Tabela"   ,"@!"," ","",.F.})
	AAdd(aCab,{"_cDescri",{15,58} ,"Descricao","@!"," ","",.F.})

	lRetMod2 := Modelo2( cTitulo,; // Titulo da Janela
						 aCab,;            // Array com os campos do cabeçalho
						 {},;              // Array com os campos do rodapé
						 aCGD,;            // Array com as coordenadas da getdados
						 3,;               // Modo de operação (3=Incluir;4=Alterar;5=Excluir)
						 "AllwaysTrue()",; // Validação da LinhaOk
						 "AllwaysTrue()",; // Validação do TudoOk
						 Nil,;             // Array com os campos da getdados que serão editáveis
						 Nil,;             // Bloco de código para a tecla F4
						 Nil,;             // String com os campos que serão inicializados quando seta para baixo
						 900,;             // Número máximo de elementos da getdados
						 Nil,;             // Coordenados windows
						 .T.,;             // Permitie deletar itens da Getdados
						 .T. )             // Maximiza a tela?

	If lRetMod2

		A610GravaCol(aCols, aHeader, aColsR, "SE1",{|| } )
	EndIf

Return Nil

Return
