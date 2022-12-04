function synchro {
    param (
        $dossierA,
        $dossierB
    )
    $dossierAcontent= Get-ChildItem $dossierA -Recurse
    $dossierBcontent= Get-ChildItem $dossierB -Recurse
    $listfull=Compare-Object $dossierAcontent $dossierBcontent -Property Name,Length -IncludeEqual
    $listfull
    foreach($i in $listfull){
        if($i.SideIndicator -eq "=>"){
            foreach($j in $dossierAcontent){
                Copy-Item $j -Destination "$dossierB" -Recurse
            }
        }
        elseif ($i.SideIndicator -eq "<=") {
            foreach($j in $dossierBcontent){
                Copy-Item $j -Destination "$dossierA" -Recurse
            }
        }
        elseif ($i.SideIndicator -eq "==") {
            foreach($k in $dossierAcontent){
                foreach($l in $dossierBcontent){
                    if ($k.LastWriteTime -ge $l.LastWriteTime){
                        Copy-Item $k -Destination $dossierB -Recurse
                    }
                    else {
                        Copy-Item $l -Destination $dossierA -Recurse
                    }
                }
            }
        }
    }
}
synchro $args[0] $args[1]
<#
La recursivité fonctionne mais j'obtient des erreurs bien que le programme effectue bien les intructions
#>



