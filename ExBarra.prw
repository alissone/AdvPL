#Include "TOTVS.CH"

User Function ExBarra()

	Local oDlg         := Nil
	Local oSay         := Nil
	Local oMeter       := Nil

	Public nStart := 0

	Processa( {|| DummyFn(10000) }, "Processando...","Calculando tempo restante...",.T. )

Return

Static Function DummyFn(nTotal)
	Local nCount   := 0.0
	// alert(u_Tempo(993610000))
	nStart := Seconds()
	ProcRegua(nTotal)
	For nCount := 1 To nTotal
		Sleep(7)
		IncProc(u_TempoRst(nStart,nCount,nTotal))
	Next
Return
