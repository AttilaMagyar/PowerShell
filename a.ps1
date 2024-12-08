param (
    [Parameter(Mandatory=$true)]
    [int]$darab
)

# Az első szám generálása 0 és 9 között
$random = Get-Random -Minimum 0 -Maximum 10
Write-Output $random

# További számok generálása
for ($i = 1; $i -lt $darab; $i++) {
    # Az aktuális szám minimum az előző, maximum az előző + 9
    $min = $random
    $max = $random + 9
    $random = Get-Random -Minimum $min -Maximum ($max + 1)
    Write-Output $random
}