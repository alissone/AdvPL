#Include "TOTVS.CH"

/*/{Protheus.doc} User Function Tempo
	Transforma milisegundos em horário por extenso

	@type  Function
	@author Alisson Amorim / alisson@email.com
	@since 06/05/2019
	@version 0.3
	@param nMilis, N, Tempo em Milissegundos
	@return cRes, C, Descrição por Extenso
	@example
	nTmRest := 5400000  // 90 minutos
	U_Tempo(nTmRest) => 1 hora e 30 minutos

	/*/

    User Function Tempo(nMilis)
	Local nSeg := 0
	Local nMin := 0
	Local nHor := 0
	Local nDia := 0
	Local cRes := ""
	Local nTmp := 0

	Local nDSeg := 1000
	Local nDMin := nDSeg*60
	Local nDHor := nDMin*60
	Local nDDia := nDHor*24

	Local nVirg := 0

	If nMilis > (nDDia)
		nTmp   := nMilis / nDDia
		nDia   := NoRound(nTmp,0)
		nMilis -= (nDia) * nDDia
	Endif

	If nMilis > (nDHor)
		nTmp   := nMilis / nDHor
		nHor   := NoRound(nTmp,0)
		nMilis -= (nHor) * nDHor
	Endif

	If nMilis > (nDMin)
		nTmp   := nMilis / nDMin
		nMin   := NoRound(nTmp,0)
		nMilis -= (nMin) * nDMin
	Endif

	If nMilis > (nDSeg)
		nTmp   := nMilis / nDSeg
		nSeg   := NoRound(nTmp,0)
		nMilis -= (nSeg) * nDSeg
	Endif

	If nDia > 0
		cRes += cValToChar(nDia)
		nVirg++
		If nDia > 1
			cRes += " dias, "
		Else
			cRes += " dia, "
		Endif
	Endif

	If nHor > 0
		cRes += cValToChar(nHor)
		nVirg++
		If nHor > 1
			cRes += " horas, "
		Else
			cRes += " hora, "
		Endif
	Endif

	If nMin > 0
		cRes += cValToChar(nMin)
		nVirg++
		If nMin > 1
			cRes += " minutos, "
		Else
			cRes += " minuto, "
		Endif
	Endif

	If nMilis > 0
		If nSeg > 1
			cRes += cValToChar(nSeg)
			cRes += " segundos, "
			nVirg++
		Else
			cRes += cValToChar(nSeg)+"."+cValToChar(nMilis)
			cRes += " segundo, "
			nVirg++
		Endif
	Endif

	cRes := Substr(cRes,1,Len(cRes)-2)
	If nVirg > 1
		// cRes := StrTran(cRes,", "," e ")
		cUltVirg := RAt(",",cRes)
		cTmp := SubStr(cRes,1,cUltVirg-1)
		cTmp += " e"
		cTmp += SubStr(cRes,cUltVirg+1,Len(cRes))
		cRes := cTmp
	Endif

Return cRes

Static Function MeterUpd(oDlg, oSay, oMeter, nStart, nCount, nTotal)
	// oDlg   => Objeto de diálogo contendo o medidor
	// oSay   => Objeto de texto que exibe o tempo restante
	// oMeter => Objeto Meter que exibe a barra de progresso

	oMeter:SetTotal(nTotal)
	oMeter:Set(nCount)
	oDlg:CommitControls()

	oSay:SetText("Tempo restante: "+ u_TempoRst(nStart,nCount,nTotal) + " ("+cValToChar(nCount)+" de "+cValToChar(nTotal)+")")
Return

/*/{Protheus.doc} User Function TempoRst
	Calcula o tempo restante de uma operação
	com base no tempo total decorrido, a iteração
	atual e a quantidade total de iterações

	@type  Function
	@author Alisson Amorim / alisson@email.com
	@since 06/05/2019
	@version 0.2
	@params nStart => Quando a função pai inicia, coloque:
			          nStart := Seconds()
 			nCount => Item atual
 			nTotal => Total de itens
	@return cRes, C, Descrição por Extenso
	@example IncProc(u_TempoRst(nStart,nCount,nTotal))

	(*) Depende de U_Tempo

	/*/

Static Function TempoRst(nStart,nCount,nTotal)
	nTmTot  := Seconds() - nStart
	nTmIter := nTmTot / nCount
	nTmRest := nTmIter * (nTotal - nCount)
Return (cValToChar(NoRound((nCount*100)/(nTotal),0))+"% concluído                                                         "+"Tempo restante: " + U_Tempo(nTmRest*1000))
