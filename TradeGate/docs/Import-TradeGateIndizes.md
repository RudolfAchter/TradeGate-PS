# Import-TradeGateIndizes
Lädt alle Indizes via Get-TradeGateIndizesFromWeb
und speicher diese als CSV


[[_TOC_]]

## Description


Lädt alle Indizes via Get-TradeGateIndizesFromWeb
und speicher diese als CSV
Unter Linux liegt die Datei in ($env:HOME + "/.local/share/powershell/config")
Unter Windows ($env:USERPROFILE + "\Documents\WindowsPowerShell\Config")




## Parameter

### -CsvPath


<table><tr><td>description</td><td>
Pfad zur CSV Datei. Standardmäßig bei der Konfigurationsdatei dieses Moduls

Standard:
Unter Linux liegt die Datei in ($env:HOME + "/.local/share/powershell/config")
Unter Windows ($env:USERPROFILE + "\Documents\WindowsPowerShell\Config")


</td></tr>
<tr><td>required</td><td>false
</td></tr>
<tr><td>position</td><td>1
</td></tr>
<tr><td>type</td><td>Object
</td></tr>
<tr><td>pipelineInput</td><td>false
</td></tr>
<tr><td>defaultValue</td><td>$Global:TradeGate.IndizesFile
</td></tr>
</table>

## Beispiele

### Beispiel 1
```powershell
Import-TradeGateIndizes
     
```
## Related Links


## Something Funny

![ruthe/1679.jpg](../../../doc/resource/comics/ruthe/1679.jpg)

---
## PlainText Hilfe

```

NAME
    Import-TradeGateIndizes
    
SYNOPSIS
    Lädt alle Indizes via Get-TradeGateIndizesFromWeb
    und speicher diese als CSV
    
    
SYNTAX
    Import-TradeGateIndizes [[-CsvPath] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    Lädt alle Indizes via Get-TradeGateIndizesFromWeb
    und speicher diese als CSV
    Unter Linux liegt die Datei in ($env:HOME + "/.local/share/powershell/config")
    Unter Windows ($env:USERPROFILE + "\Documents\WindowsPowerShell\Config")
    

PARAMETERS
    -CsvPath <Object>
        Pfad zur CSV Datei. Standardmäßig bei der Konfigurationsdatei dieses Moduls
        
        Standard:
        Unter Linux liegt die Datei in ($env:HOME + "/.local/share/powershell/config")
        Unter Windows ($env:USERPROFILE + "\Documents\WindowsPowerShell\Config")
        
        Required?                    false
        Position?                    1
        Default value                $Global:TradeGate.IndizesFile
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (https://go.microsoft.com/fwlink/?LinkID=113216). 
    
INPUTS
    
OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS > Import-TradeGateIndizes
    
    
    
    
    
    
    
RELATED LINKS


```

