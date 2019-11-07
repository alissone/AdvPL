#include "protheus.ch"

/*/{Protheus.doc} User Function ChkCompl
	Exemplo do funcionamento da função GetSrcArray
	@type  Function
	@author Alisson Amorim / alisson@email.com
	@since 07/11/2019
	@version 0.1

	/*/
User Function ChkCompl()

	Local aFontes := {}
	Local cFonte := "exemplo.prw"
	aFontes := GetSrcArray(cFonte)

	If Len(aFontes) = 0
        MsgStop("O fonte "+cFonte+" não está compilado no repositorio.\n Favor entrar em contato com o suporte!")
    Else
        // Chame sua rotina aqui
	Endif

Return Nil