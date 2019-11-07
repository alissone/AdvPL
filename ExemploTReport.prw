#Include "Protheus.Ch"
#Include "Topconn.Ch"
#Include 'Rwmake.Ch'

/*/{Protheus.doc} User Function ExMyRepo
	Exemplo de TReport com SQL

	@type User Function
	@author  Alisson Amorim / alisson@email.com
	@since 14/08/2019
/*/

User Function ExMyRepo()

	Local oReport := TReport():New('TITULO',"teste",/*cPerg*/,{|oReport|__PRPrint(oReport)},,,,,,,,)
	Local nI
	Local oBreak
	Local nRegistros := 0
	Local nMaxReg := 20

	// Filtrando os dados
	cQuery  := "SELECT * FROM "+retSqlName("SE1")+", "+retSqlName("SA1")"

	TCQUERY cQuery New Alias "QRYFLG"
	QRYFLG->(dbSelectArea("QRYFLG"))
	QRYFLG->(dbGoTop())

	//// É possível também utilizar com Array ao invés de consulta SQL:
	// aRegst  := {}
	// While (!QRYFLG->(eof()) .AND. nRegistros < nMaxReg)
	// 	nRegistros++
	// 	AADD(aRegst,&("QRYFLG->" + "A1_NOME") )
	// 	AADD(aRegst,&("QRYFLG->" + "E1_PREFIXO") )
	// 	QRYFLG->(dbSkip())
	// enddo

	oReport:SetTotalInLine(.F.)
	oReport:SetTitle('Protheus Report Utility')
	oReport:SetLineHeight(30)
	oReport:SetColSpace(1)
	oReport:SetLeftMargin(0)
	oReport:oPage:SetPageNumber(1)
	oReport:cFontBody := 'Arial'
	oReport:nFontBody := 6
	oReport:lBold := .F.
	oReport:lUnderLine := .F.
	oReport:lHeaderVisible := .T.
	oReport:lFooterVisible := .T.
	oReport:lParamPage := .F.
	oTreport02:= TRSection():New(oReport,'Contas a Receber',,,,,,,,,,,,,,,,,,,)
	oTreport02:SetTotalInLine(.F.)
	oTreport02:SetTotalText('Contas a Receber')
	oTreport02:lUserVisible := .T.
	oTreport02:lHeaderVisible := .F.
	oTreport02:SetLineStyle(.F.)
	oTreport02:SetLineHeight(30)
	oTreport02:SetColSpace(1)
	oTreport02:SetLeftMargin(0)
	oTreport02:SetLinesBefore(0)
	oTreport02:SetCols(0)
	oTreport02:SetHeaderSection(.T.)
	oTreport02:SetHeaderPage(.F.)
	oTreport02:SetHeaderBreak(.F.)
	oTreport02:SetLineBreak(.F.)
	oTreport02:SetAutoSize(.F.)
	oTreport02:SetPageBreak(.F.)
	oTreport02:SetClrBack(16777215)
	oTreport02:SetClrFore(0)
	oTreport02:SetBorder('')
	oTreport02:SetBorder('',,,.T.)
	oTreport02:aTable := {}
	oTreport02:AddTable("QRYFLG")
	oTreport02:OnPrintLine({|| If(SE1->E1_FILIAL $ '01|02|', .T., .F.)})

	TRCell():New(/*oParent*/ oTreport02 ,/*cName*/ "A1_NOME",    /*cAlias*/ "QRYFLG", /*cTitle*/ "Nome",       /*cPicture*/ "@!", /*nSize*/ 40, /*lPixel*/, /*bBlock*/, /*cAlign*/ "LEFT", /*lLineBreak*/ .T., /*cHeaderAlign*/ "LEFT", /*lCellBreak*/, /*nColSpace*/, /*lAutoSize*/ .T., /*nClrBack*/ 16777215, /*nClrFore*/ 0, /*lBold*/ .F.)
	TRCell():New(/*oParent*/ oTreport02 ,/*cName*/ "E1_PREFIXO", /*cAlias*/ "QRYFLG", /*cTitle*/ "Prefixo",    /*cPicture*/ "@!", /*nSize*/ 6,  /*lPixel*/, /*bBlock*/, /*cAlign*/ "LEFT", /*lLineBreak*/ .T., /*cHeaderAlign*/ "LEFT", /*lCellBreak*/, /*nColSpace*/, /*lAutoSize*/ .F., /*nClrBack*/ 16777215, /*nClrFore*/ 0, /*lBold*/ .F.)
	TRCell():New(/*oParent*/ oTreport02 ,/*cName*/ "E1_NUM",     /*cAlias*/ "QRYFLG", /*cTitle*/ "No. Titulo", /*cPicture*/ "@!", /*nSize*/ 3,  /*lPixel*/, /*bBlock*/, /*cAlign*/ "LEFT", /*lLineBreak*/ .T., /*cHeaderAlign*/ "LEFT", /*lCellBreak*/, /*nColSpace*/, /*lAutoSize*/ .F., /*nClrBack*/ 16777215, /*nClrFore*/ 0, /*lBold*/ .F.)
	TRCell():New(/*oParent*/ oTreport02 ,/*cName*/ "E1_PARCELA", /*cAlias*/ "QRYFLG", /*cTitle*/ "Parcela",    /*cPicture*/ "@!", /*nSize*/ 1,  /*lPixel*/, /*bBlock*/, /*cAlign*/ "LEFT", /*lLineBreak*/ .T., /*cHeaderAlign*/ "LEFT", /*lCellBreak*/, /*nColSpace*/, /*lAutoSize*/ .F., /*nClrBack*/ 16777215, /*nClrFore*/ 0, /*lBold*/ .F.)
	TRCell():New(/*oParent*/ oTreport02 ,/*cName*/ "E1_CLIENTE", /*cAlias*/ "QRYFLG", /*cTitle*/ "Cliente",    /*cPicture*/ "@!", /*nSize*/ 6,  /*lPixel*/, /*bBlock*/, /*cAlign*/ "LEFT", /*lLineBreak*/ .T., /*cHeaderAlign*/ "LEFT", /*lCellBreak*/, /*nColSpace*/, /*lAutoSize*/ .F., /*nClrBack*/ 16777215, /*nClrFore*/ 0, /*lBold*/ .F.)
	TRCell():New(/*oParent*/ oTreport02 ,/*cName*/ "E1_LOJA",    /*cAlias*/ "QRYFLG", /*cTitle*/ "Loja",       /*cPicture*/ "@!", /*nSize*/ 1,  /*lPixel*/, /*bBlock*/, /*cAlign*/ "LEFT", /*lLineBreak*/ .T., /*cHeaderAlign*/ "LEFT", /*lCellBreak*/, /*nColSpace*/, /*lAutoSize*/ .F., /*nClrBack*/ 16777215, /*nClrFore*/ 0, /*lBold*/ .F.)

	TRPosition():New(oTreport02,'SA1',1,{ || xFilial()+QRYFLG->(E1_CLIENTE+E1_LOJA) } )

	oBreak := TRBreak():New(oTreport02,{ ||	oTreport02:Cell('E1_CLIENTE'):uPrint+oTreport02:Cell('E1_LOJA'):uPrint },'Sub-Total',.F.)
	TRFunction():New(oTreport02:Cell('E1_CLIENTE'),, 'COUNT',oBreak ,,,,.F.,.F.,.F., oTreport02)

	oTreport02:LoadOrder()
	oReport:PrintDialog()
Return
