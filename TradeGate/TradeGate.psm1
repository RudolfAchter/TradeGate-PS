
<#
TradeGate hat kein Krypto.
Das sollte aber hiermit gehen´
- https://messari.io/api
#>


$global:thisModuleName = "TradeGate"

if ($null -ne $env:HOME) {
    #Linux
    #Unter Linux sind die Default Pfade anders 
    #TODO (ich glaube auch in Powershell Core 7?) muss ich mir anschauen
    $Global:PowershellConfigDir = ($env:HOME + "/.local/share/powershell/config")
}
elseif ($null -ne $env:USERPROFILE) {
    #Windows
    #ProgramData Override Wenn ich eine Globale Konfig in ProgramData gesetzt habe
    #TODO evtl noch umbauen. Erst Default Global Config, dann darf der User "Override" machen.
    #Dann braucht der User aber auch ein Cmdlet mit dem er das steuern kann
    if (Test-Path ($env:ProgramData + "\WindowsPowerShell\Config\" + $global:thisModuleName + ".config.ps1")) {
        #Wenn die ProgramData Config existiert dann zählt die einfach für ALLE
        $Global:PowershellConfigDir = ($env:ProgramData + "\WindowsPowerShell\Config")
    }
    else {
        #Ansonsten die User spezifische Konfig nehmen
        $Global:PowershellConfigDir = ($env:USERPROFILE + "\Documents\WindowsPowerShell\Config")
    }
}


If (-not (Test-Path $Global:PowershellConfigDir)) {
    mkdir $Global:PowershellConfigDir
}

#Konfig File schreiben
If (-not (Test-Path ($Global:PowershellConfigDir + "\" + $global:thisModuleName + ".config.ps1"))) {
    Set-Content -Path ($Global:PowershellConfigDir + "\" + $global:thisModuleName + ".config.ps1") -Value (@'

'@)

}
#Wenn Konfig File bereits existiert, Konfig File holen
else {
    . ($Global:PowershellConfigDir + "\" + $global:thisModuleName + ".config.ps1")
}



function Get-TradeGateIndizesPage {
<#
.SYNOPSIS
Ruft Indizes von einer TradeGate Seite ab

.DESCRIPTION
Ruft Indizes von einer TradeGate Seite ab. Verlangt die
Url als Eingabeparameter. Ich versuche die Links zu finden die auf
"orderbuch.php" verweisen und lese aus diesen Links die ISIN und den
Namen der Aktion aus

.PARAMETER Url
Link zu einer TradeGate Seite mit Aktien Tabellen

.EXAMPLE
Get-TradeGateIndizesPage -Url https://www.tradegate.de/indizes.php?buchstabe=E

#>
    [CmdletBinding()]
    param (
       [string]$Url 
    )
    
    $result=Invoke-WebRequest -Uri $Url
    $result.Links | Where-Object {$_.href -like "orderbuch.php?isin=*" -and $_.id -like "name_*"} | ForEach-Object{
        $link=$_
        #Aus dem Link die Werte raussuchen die mich interessieren
        $match=$link.OuterHTML | Select-String -Pattern '<a id="([^"]+)".*?href="orderbuch.php\?isin=([^"]+)".*?>(.*?)<\/a>'

        [PSCustomObject]@{
            Isin = $match.Matches.Groups[2].Value
            Name = [System.Web.HttpUtility]::HtmlDecode(($match.Matches.Groups[3].Value.Replace("<wbr>","")))
        }

    }
}


function Get-TradeGateIndizesFromWebByChar {
<#
.SYNOPSIS
Ruft eine TradeGate Seite mit Anfangsbuchstaben
der Seite ab

.DESCRIPTION
Ruft eine TradeGate Seite mit Anfangsbuchstaben
der Seite ab. Liefert Indizes Namen und Isin zurück

.PARAMETER Char
ein Buchstabe oder eine Zahl

.EXAMPLE
Get-TradeGateIndizesFromWebByChar -Char A

.NOTES
General notes
#>
    [CmdletBinding()]
    param (
       [string]$Char 
    )
    Get-TradeGateIndizesPage -Url ($Global:TradeGate.StartUrl + "/indizes.php?buchstabe=" + $Char)
}

function Get-TradeGateIndizesFromWeb {
<#
.SYNOPSIS
Lädt Alle Indizes der TradeGate Seite
in dem alle Anfangsbuchstaben und Zahlen abgerufen werden

.DESCRIPTION
Lädt Alle Indizes der TradeGate Seite
in dem alle Anfangsbuchstaben und Zahlen abgerufen werden

.EXAMPLE
Get-TradeGateIndizesFromWeb
#>
    [CmdletBinding()]
    param (
    )
    
    $a_chars=@()
    #0-9
    for($i=0;$i -le 9;$i++){
        $a_chars+=[string]$i
    }

    #a-z
    for($i=97;$i -le 122;$i++){
        $a_chars+=[char]$i
    }
    
    ForEach($char in $a_chars){
        #Write-Host($char)
        Get-TradeGateIndizesFromWebByChar -Char $char
    }

}

function Import-TradeGateIndizes {
<#
.SYNOPSIS
Lädt alle Indizes via Get-TradeGateIndizesFromWeb
und speicher diese als CSV

.DESCRIPTION
Lädt alle Indizes via Get-TradeGateIndizesFromWeb
und speicher diese als CSV
Unter Linux liegt die Datei in ($env:HOME + "/.local/share/powershell/config")
Unter Windows ($env:USERPROFILE + "\Documents\WindowsPowerShell\Config")

.PARAMETER CsvPath
Pfad zur CSV Datei. Standardmäßig bei der Konfigurationsdatei dieses Moduls

Standard:
Unter Linux liegt die Datei in ($env:HOME + "/.local/share/powershell/config")
Unter Windows ($env:USERPROFILE + "\Documents\WindowsPowerShell\Config")

.EXAMPLE
Import-TradeGateIndizes

#>
    [CmdletBinding()]
    param (
        $CsvPath=$Global:TradeGate.IndizesFile
    )
    Write-Host("Saving TradeGate Indizes in '" + $CsvPath + "'")
    Get-TradeGateIndizesFromWeb | Export-Csv -Path $CsvPath -Delimiter ";" -Encoding UTF8 -NoTypeInformation
}

function Get-TradeGateIndizes {
<#
.SYNOPSIS
Zeigt Indizes aus der CSV-Datei an die vorher mit
Import-TradeGateIndizes importiert wurde

.DESCRIPTION
Zeigt Indizes aus der CSV-Datei an die vorher mit
Import-TradeGateIndizes importiert wurde

.PARAMETER CsvPath
Unter Linux liegt die Datei in ($env:HOME + "/.local/share/powershell/config")
Unter Windows ($env:USERPROFILE + "\Documents\WindowsPowerShell\Config")
Wenn du die Datei in einem anderden Pfad gespeicher hast musst du den Pfad manuell angeben

.PARAMETER Name
Name der gesuchten Aktie (du kannst mit Wildcard "*" suchen)

.PARAMETER Isin
Isin der gesuchten Aktie

.EXAMPLE
Get-TradeGateIndizes -Name Beyond*
#>
    [CmdletBinding()]
    param (
        $CsvPath=$Global:TradeGate.IndizesFile,
        
        $Name=$null,
        
        $Isin=$null
    )
    

    if($null -eq $TradeGate.EntriesCache){
        #Wenn ich den Entries Cache noch nicht befüllt habe dann Daten aus der CSV holen (die paar Einträge im RAM)
        $entries=Import-Csv -Path $CsvPath -Delimiter ";" -Encoding utf8
    }
    else{
        #Ansonsten Daten aus dem Cache holen
        $entries=$Global:TradeGate.EntriesCache
    }

    if($null -ne $Isin){
        $entries=$entries | Where-Object{$_.Isin -like $Isin}
    }


    if($null -ne $Name){
        $entries=$entries | Where-Object{$_.Name -like $Name}
    }
    $entries
}

Set-Alias -Name "Get-TradeGateIndex" -Value "Get-TradeGateIndizes"

function Get-TradeGateValues {
<#
.SYNOPSIS
Zeigt die aktuellen Werte einer oder mehrerer Aktien an

.DESCRIPTION
Zeigt die aktuellen Werte einer oder mehrerer Aktien an

.PARAMETER Index
Index Objekt das mit Get-TradeGateIndizes geholt wurde
oder eine ISIN (als ID)

.EXAMPLE
Get-TradeGateValues -Index (Get-TradeGateIndex -Name Beyond*) | Format-Table -AutoSize

# Sieht dann z.B. so aus

# Name                           Isin            bid   ask bidsize asksize delta  stueck umsatz     avg
# ----                           ----            ---   --- ------- ------- -----  ------ ------     ---
# Beyond Air Inc.                US08862L1035   4,08  4,34     540     510 +0,95%     28    118    4,23
# Beyond Meat Inc.               US08862E1091  86,97 87,99      40      40 -0,68%  10379 921186 88,7548
# Beyond Medical Technolog. Inc. CA0886411051 0,0594  0,07   68000   58000 0,00%       0      0     ./.

#>
    param(
        [Alias("Isin")]
        $Index
    )

    Begin{}

    Process{
        $Index | ForEach-Object {
            #Ich Erwarte ein TradeGateIndex Objekt oder eine ISIN als String
            $o_index=$_
            if($o_index.GetType().Name -eq "String"){
                $o_index=Get-TradeGateIndizes -Isin $Index
            }

            $result=Invoke-RestMethod -Uri ($Global:TradeGate.StartUrl + "/refresh.php?isin=" + $o_index.Isin)
            Add-Member -InputObject $result -MemberType NoteProperty -Name "Name" -Value $o_index.Name
            Add-Member -InputObject $result -MemberType NoteProperty -Name "Isin" -Value $o_index.Isin
            $result | Select-Object Name,Isin,bid,ask,bidsize,asksize,delta,stueck,umsatz,avg,last,high,low
        }
    }

    End{}
}
