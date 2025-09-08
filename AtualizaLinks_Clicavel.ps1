# AtualizaLinks_Clicavel.ps1

# --- CONFIGURAÇÃO ---
$Pasta = "C:\MeusHTMLs"  # Caminho da pasta com seus arquivos HTML
$LinkAntigo = "https://redecanaistv.ps/"
$LinkNovo = "https://redecanaistv.ee/"
$FazerBackup = $true  # True = cria backup antes de substituir

# --- EXECUÇÃO ---
try {
    Set-Location $Pasta
} catch {
    [System.Windows.Forms.MessageBox]::Show("Pasta não encontrada: $Pasta","Erro","OK","Error")
    exit
}

if ($FazerBackup) {
    $BackupPasta = "$Pasta\Backup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
    New-Item -ItemType Directory -Path $BackupPasta
    Copy-Item *.html $BackupPasta
    [System.Windows.Forms.MessageBox]::Show("Backup criado em: $BackupPasta","Backup","OK","Info")
}

Get-ChildItem *.html | ForEach-Object {
    (Get-Content $_.FullName) -replace [regex]::Escape($LinkAntigo), $LinkNovo | Set-Content $_.FullName
}

[System.Windows.Forms.MessageBox]::Show("Todos os links foram atualizados!","Sucesso","OK","Info")