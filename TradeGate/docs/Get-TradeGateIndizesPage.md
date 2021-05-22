# Get-TradeGateIndizesPage
Ruft Indizes von einer TradeGate Seite ab


[[_TOC_]]

## Description


Ruft Indizes von einer TradeGate Seite ab. Verlangt die
Url als Eingabeparameter. Ich versuche die Links zu finden die auf
"orderbuch.php" verweisen und lese aus diesen Links die ISIN und den
Namen der Aktion aus




## Parameter

### -Url


<table><tr><td>description</td><td>
Link zu einer TradeGate Seite mit Aktien Tabellen


</td></tr>
<tr><td>required</td><td>false
</td></tr>
<tr><td>position</td><td>1
</td></tr>
<tr><td>type</td><td>String
</td></tr>
<tr><td>pipelineInput</td><td>false
</td></tr>
<tr><td>defaultValue</td><td>
</td></tr>
</table>

## Beispiele

### Beispiel 1
```powershell
Get-TradeGateIndizesPage -Url https://www.tradegate.de/indizes.php?buchstabe=E
     
```
## Related Links


## Something Funny

![ruthe/1986.jpg](../../../doc/resource/comics/ruthe/1986.jpg)

---
## PlainText Hilfe

```

NAME
    Get-TradeGateIndizesPage
    
SYNOPSIS
    Ruft Indizes von einer TradeGate Seite ab
    
    
SYNTAX
    Get-TradeGateIndizesPage [[-Url] <String>] [<CommonParameters>]
    
    
DESCRIPTION
    Ruft Indizes von einer TradeGate Seite ab. Verlangt die
    Url als Eingabeparameter. Ich versuche die Links zu finden die auf
    "orderbuch.php" verweisen und lese aus diesen Links die ISIN und den
    Namen der Aktion aus
    

PARAMETERS
    -Url <String>
        Link zu einer TradeGate Seite mit Aktien Tabellen
        
        Required?                    false
        Position?                    1
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
    
    PS > Get-TradeGateIndizesPage -Url https://www.tradegate.de/indizes.php?buchstabe=E
    
    
    
    
    
    
    
RELATED LINKS


```

