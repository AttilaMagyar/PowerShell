# Beolvassuk az adatokat a fájlból
$filePath = "kavefogyasztas.txt"
$data = Get-Content $filePath

# Feldolgozzuk az adatokat
foreach ($line in $data) {
    $parts = $line -split ";"
    $name = $parts[0]
    $consumptions = $parts[1] -split " " | ForEach-Object { [int]$_ }
    $total = ($consumptions | Measure-Object -Sum).Sum
    Write-Output "${name}: ${total}"
}