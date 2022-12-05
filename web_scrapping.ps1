$url="https://www.basketusa.com/equipe/los-angeles-lakers/"
$basket=Invoke-RestMethod $url
$pathern1='<h3>(?<quote>.*)<'
$pathern2='<span class="meta-date">(?<date>.*)<'
#filtrage avec match
$basket_all_info_title=($basket | Select-String $pathern1 -AllMatches).Matches 
#-------------Titre--------------------
$Booktitle = foreach($i in $basket_all_info_title)
{
    [PSCustomObject]@{
        'Titre' = ($i.Groups[1].Value)
    }
}
#-------------Date-------------------------
$basket_all_info_date=($basket | Select-String $pathern2 -AllMatches).Matches#recupère bien toutes mes dates
$Bookdate = foreach($j in $basket_all_info_date){
    [PSCustomObject]@{
        'Date' = $j.Groups[1].Value
    }
}
#Exportation dans un fichier csv
$Booktitle |Export-Csv -Path ./Basketbook.csv -Encoding utf32
#$Bookdate | Export-Csv -Path ./Basketbook.csv | Where-Object -Property ColA
<# Je n'arrive pas afficher mes dates sur les autres colonnes de mon fichier csv sinon ça ecrase la colonne A ou se trouve mes titres#>