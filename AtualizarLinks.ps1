1- Abrindo o CMD na pasta correta

Antes de rodar qualquer comando, abra o CMD direto na pasta dos arquivos HTML.

Método rápido:

Abra a pasta onde estão os arquivos .html.

Na barra de endereços do Windows Explorer, digite:

cmd


Pressione Enter → o CMD já será aberto nessa pasta.

Exemplo:
Se seus arquivos estão em C:\meus_html, ao abrir o CMD, ele mostrará:

C:\meus_html>

2-Com o CMD já aberto na pasta, execute este comando:


powershell -Command "Get-ChildItem -Recurse -Filter *.html | ForEach-Object { (Get-Content $_.FullName) -replace 'https://redecanaistv.ee/play.php?','https://redecanaistv.sb/player3/ch.php?' | Set-Content $_.FullName }"



Explicação simples do comando

Get-ChildItem -Recurse -Filter *.html → procura todos os arquivos .html na pasta e subpastas.

Get-Content $_.FullName → lê o conteúdo de cada arquivo.

-replace 'antigo','novo' → troca o link antigo pelo novo.

Set-Content $_.FullName → salva o resultado diretamente no mesmo arquivo.
