# Get-TradeGateIndizes
Zeigt Indizes aus der CSV-Datei an die vorher mit
Import-TradeGateIndizes importiert wurde


[[_TOC_]]

## Description


Zeigt Indizes aus der CSV-Datei an die vorher mit
Import-TradeGateIndizes importiert wurde




## Parameter

### -CsvPath


<table><tr><td>description</td><td>
Unter Linux liegt die Datei in ($env:HOME + "/.local/share/powershell/config")
Unter Windows ($env:USERPROFILE + "\Documents\WindowsPowerShell\Config")
Wenn du die Datei in einem anderden Pfad gespeicher hast musst du den Pfad manuell angeben


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

### -Name


<table><tr><td>description</td><td>
Name der gesuchten Aktie (du kannst mit Wildcard "*" suchen)


</td></tr>
<tr><td>required</td><td>false
</td></tr>
<tr><td>position</td><td>2
</td></tr>
<tr><td>type</td><td>Object
</td></tr>
<tr><td>pipelineInput</td><td>false
</td></tr>
<tr><td>defaultValue</td><td>
</td></tr>
</table>

### -Isin


<table><tr><td>description</td><td>
Isin der gesuchten Aktie


</td></tr>
<tr><td>required</td><td>false
</td></tr>
<tr><td>position</td><td>3
</td></tr>
<tr><td>type</td><td>Object
</td></tr>
<tr><td>pipelineInput</td><td>false
</td></tr>
<tr><td>defaultValue</td><td>
</td></tr>
</table>

## Beispiele

### Beispiel 1
```powershell
Get-TradeGateIndizes -Name Beyond*
     
```
## Related Links


## Something Funny

![ruthe/0897.jpg](../../../doc/resource/comics/ruthe/0897.jpg)

---
## PlainText Hilfe

```

NAME
    Get-TradeGateIndizes
    
SYNOPSIS
    Zeigt Indizes aus der CSV-Datei an die vorher mit
    Import-TradeGateIndizes importiert wurde
    
    
SYNTAX
    Get-TradeGateIndizes [[-CsvPath] <Object>] [[-Name] <Object>] [[-Isin] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    Zeigt Indizes aus der CSV-Datei an die vorher mit
    Import-TradeGateIndizes importiert wurde
    

PARAMETERS
    -CsvPath <Object>
        Unter Linux liegt die Datei in ($env:HOME + "/.local/share/powershell/config")
        Unter Windows ($env:USERPROFILE + "\Documents\WindowsPowerShell\Config")
        Wenn du die Datei in einem anderden Pfad gespeicher hast musst du den Pfad manuell angeben
        
        Required?                    false
        Position?                    1
        Default value                $Global:TradeGate.IndizesFile
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -Name <Object>
        Name der gesuchten Aktie (du kannst mit Wildcard "*" suchen)
        
        Required?                    false
        Position?                    2
        Default value                
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    -Isin <Object>
        Isin der gesuchten Aktie
        
        Required?                    false
        Position?                    3
        Default value                
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
    
    PS > Get-TradeGateIndizes -Name Beyond*
    
    
    
    
    
    
    
RELATED LINKS


```

