# Ékezetek cseréjéhez szükséges karaktertérkép
function Remove-Accents {
    param ([string]$text)
    $replacements = @{
        'á' = 'a'; 'é' = 'e'; 'í' = 'i'; 'ó' = 'o'; 'ö' = 'o'; 'ő' = 'o';
        'ú' = 'u'; 'ü' = 'u'; 'ű' = 'u'
    }
    foreach ($key in $replacements.Keys) {
        $text = $text -replace $key, $replacements[$key]
    }
    return $text
}

# Bemenet feldolgozása
while ($true) {
    $line = Read-Host "Adja meg a nevet (vagy hagyja üresen a kilépéshez)"
    if ([string]::IsNullOrWhiteSpace($line)) { break }

    # Név szétválasztása
    $parts = $line -split ' '
    if ($parts.Count -ne 2) {
        Write-Output "Hibás formátum. Írja be a nevet 'Keresztnév Vezetéknév' formában."
        continue
    }
    $keresztnev = $parts[0]
    $vezeteknev = $parts[1]

    # Kisbetűk, ékezetmentesítés
    $keresztnev = Remove-Accents($keresztnev.ToLower())
    $vezeteknev = Remove-Accents($vezeteknev.ToLower())

    # E-mail cím generálása
    $email = "$vezeteknev$keresztnev@szervezet.elte.hu"
    Write-Output $email
}
