New-Item "./dossierA" -ItemType Directory
New-Item "./dossierB" -ItemType Directory
New-Item "./dossierC" -ItemType Directory

if(Test-Path ./dossierA){
    New-Item "./dossierA/test1.txt" -ItemType File -Value "Bonjour"
    New-Item "./dossierA/test2.txt" -ItemType File -Value "Bonjour"
    New-Item "./dossierA/test3.txt" -ItemType File -Value "Bonjour"
    
}
if(Test-Path ./dossierB){
    New-Item "./dossierB/test1.txt" -ItemType File -Value "Bonjour"
    New-Item "./dossierB/testB.txt" -ItemType File -Value "Bonjour"
    New-Item "./dossierB/testC.txt" -ItemType File -Value "Bonjour"
}
else {
    
    Write-Host "le fichier n'existe pas"
}



