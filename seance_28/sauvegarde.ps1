reg export "HKLM\SOFTWARE\Groupe ABC\Turbine TACD" z:\Turbine\configuration.reg /y
$auj = Get-Date -Format "yyyy-MM-dd"
$heure = Get-Date -Format "HH:mm:ss"
Compress-Archive -DestinationPath "z:\Turbine\configuration $auj.zip" -Path z:\Turbine\configuration.reg
"$auj $heure Sauvegarde réalisée dans le fichier configuration $auj.zip" | Out-File "z:\journal.log" -Append