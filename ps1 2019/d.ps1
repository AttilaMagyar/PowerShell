param(
    [switch]$keves,
    [switch]$atlag
)

# Adatok beolvasása abszolút útvonalról
$filePath = Join-Path -Path $PSScriptRoot -ChildPath "jegyek.txt"
Write-Output "Fájl elérési út: $filePath"

if (-Not (Test-Path $filePath)) {
    Write-Output "A fájl nem található: $filePath"
    exit
} else {
    Write-Output "Fájl megtalálva: $filePath"
}

# Fájl feldolgozása
$content = Get-Content $filePath
$records = $content | ForEach-Object {
    $parts = $_ -split ";"
    $name = $parts[0].Trim()
    $grades = $parts[1] -split " " | ForEach-Object { [int]$_ }
    [PSCustomObject]@{
        Name = $name
        Grades = $grades
        Count = $grades.Count
        Average = if ($grades.Count -gt 0) { [math]::Round(($grades | Measure-Object -Sum).Sum / $grades.Count, 2) } else { 0 }
    }
}

if ($keves) {
    $records | Where-Object { $_.Count -lt 5 } | ForEach-Object { $_.Name }
}
elseif ($atlag) {
    $records | Where-Object { $_.Count -ge 5 } | ForEach-Object {
        "$($_.Name);$($_.Average);$($_.Grades -join ' ')"
    }
}
else {
    $records | Where-Object { $_.Count -lt 5 } | ForEach-Object { $_.Name }
    Write-Output ""
    $records | Where-Object { $_.Count -ge 5 } | ForEach-Object {
        "$($_.Name);$($_.Average);$($_.Grades -join ' ')"
    }
}
