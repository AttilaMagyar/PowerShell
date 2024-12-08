param (
    [int]$ar = 40  # Alapértelmezett ár egy kávéért
)

# Pipeline-ról érkező adatokat feldolgozzuk
$data = @()
foreach ($line in $Input) {
    $data += $line
}

# Eredményeket feldolgozzuk
$result = @()
foreach ($line in $data) {
    $parts = $line -split ": "
    $name = $parts[0]
    $total = [int]$parts[1]
    $cost = $total * $ar
    $result += @{
        Name = $name
        Total = $total
        Cost = $cost
    }
}

# Rendezzük fogyasztás szerint és kiírjuk
$result = $result | Sort-Object -Property Total -Descending
$result | ForEach-Object {
    Write-Output "$($_.Name): $($_.Cost)"
}