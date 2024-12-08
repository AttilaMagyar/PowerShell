# Az aktuális mappa kiírása
Write-Output "Aktuális mappa: $(Get-Location)"

# Az aktuális mappa tartalmának lekérdezése
Write-Output "Aktuális mappa tartalma:"
Get-ChildItem -Path . -File | ForEach-Object { $_.Name }

# Az almappák közvetlen tartalmának kiírása
$subfolders = Get-ChildItem -Path . -Directory
foreach ($folder in $subfolders) {
    Write-Output "`nAlmappa: $($folder.Name)"
    Get-ChildItem -Path $folder.FullName -File | ForEach-Object { $_.Name }
}