# Kérj be szöveget a felhasználótól
$text = Read-Host "Írj be egy szöveget"

# Számítsd ki a szöveg hosszát, és adj hozzá 4-et (2 csillag mindkét oldalra)
$lineLength = $text.Length + 4

# Készítsd el a felső és alsó csillagsort
$stars = "*" * $lineLength

# Írd ki a formázott szöveget csillagokkal körülvéve
Write-Output $stars
Write-Output "* $text *"
Write-Output $stars