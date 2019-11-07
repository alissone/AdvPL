# Funções AdvPL

#### Esse repositório contém funções e snippets úteis para facilitar a vida de analistas Protheus


![Alt text](img/ExemploTempoRestante.png?raw=true "TempoRst.prw")

 - **TempoRst.prw**: Utilidade para cálculo de tempo restante em um loop ou query
 - **ExBarra.prw**: Exemplo da `TempoRst.prw` com barra de progresso `Processa()`

 - **ChkCompl**: Exemplo da função GetSrcArray para verificar se um determinado fonte está compilado no repositório atual

 - **ExInterfaceGrafica**: Exemplos de funções do sistema para interação com usuário por interface gráfica:

    > ExConPad: Consulta Padrão

    > ExMbrw: MBrowse

    > ArrIncl: Marca elementos repetidos ao adicionar a um array

    > ExArrIn: Exemplo do ArrIncl

    > ExModelo2: Modelo2

 - **ExemploTReport.prw**: Relatório com TReport simples a partir de Query SQL
 - **cBuildFil.prw**: Converter range numérica em string para array numérico ou expressão SQL

 ___

# DBTrace Parser
#### Aplicação criada em Python para extrair queries SQL de logs do DBTrace

![Alt text](img/ExtraçãoSQL_DBTrace.png?raw=true "Exemplo de SQL extraído pelo DBTrace Parser")

Utilizada para rápida detecção de falhas na construção de queries SQL a partir do AdvPL,
facilmente gerando um arquivo SQL para ser utilizado diretamente no banco de dados para
debugging.

Para utilizá-lo, utilize a função **Rastrear** no DBMonitor:

![Alt text](img/DBMonitor.png?raw=true "Exemplo de SQL extraído pelo DBTrace Parser")

Depois, salve em um arquivo .TRC e abra com o DBTrace Parser.

Mais dicas sobre o assunto em: *https://tdn.totvs.com/display/framework/Desenvolvendo+queries+no+Protheus*

*Em breve o código fonte completo deste será incluso neste repositório.*

---

# Blender TReport


O arquivo **ArestasFWMsPrinter.blend** contém um template e script para converter modelos 3D em objetos para utilização no TReport no Protheus. Serão consideradas apenas arestas desconexas (V -> Rip Edges), a partir da visão ortográfica superior.

O template contém uma página A4 com régua em centímetros. O script também é capaz de gerar uma função AdvPL para converter milímetros em unidades (arbitrárias) do TReport.

*Compatível com Blender 2.8 e versões posteriores.*

