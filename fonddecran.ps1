# URL de l'image (lien RAW GitHub)
$imageUrl = "https://raw.githubusercontent.com/L4Curtis/rubberduckyTP/main/5448.jpg"

# Chemin local où l'image sera enregistrée (TEMP)
$wallpaperPath = "$env:TEMP\wallpaper_digispark.jpg"

# Téléchargement de l'image dans %TEMP%
Invoke-WebRequest -Uri $imageUrl -OutFile $wallpaperPath

# Petit délai de sécurité
Start-Sleep -Seconds 1

# Code C# pour appeler l'API Windows
$code = @"
using System.Runtime.InteropServices;

public class WallpaperSetter {
    [DllImport("user32.dll", SetLastError = true)]
    public static extern bool SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@

# Chargement du type
Add-Type $code

# Constantes Windows
$SPI_SETDESKWALLPAPER = 20;
$SPIF_UPDATEINIFILE = 0x01;
$SPIF_SENDWININICHANGE = 0x02;

# Application du fond d'écran
[WallpaperSetter]::SystemParametersInfo(
    $SPI_SETDESKWALLPAPER,
    0,
    $wallpaperPath,
    $SPIF_UPDATEINIFILE -bor $SPIF_SENDWININICHANGE
) | Out-Null
