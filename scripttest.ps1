# Crée un fichier de test dans Public
$path = "C:\Users\Public\digispark_test.txt"

# Ajoute un texte
"Script github lancé" | Out-File $path -Encoding UTF8

# Ouvre le fichier dans Notepad pour preuve
Start-Process notepad.exe $path
