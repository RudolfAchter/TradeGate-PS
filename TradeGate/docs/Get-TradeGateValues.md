# Get-TradeGateValues
Zeigt die aktuellen Werte einer oder mehrerer Aktien an


[[_TOC_]]

## Description


Zeigt die aktuellen Werte einer oder mehrerer Aktien an




## Parameter

### -Index


<table><tr><td>description</td><td>
Index Objekt das mit Get-TradeGateIndizes geholt wurde
oder eine ISIN (als ID)


</td></tr>
<tr><td>required</td><td>false
</td></tr>
<tr><td>position</td><td>1
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
Get-TradeGateValues -Index (Get-TradeGateIndex -Name Beyond*) | Format-Table -AutoSize
# Sieht dann z.B. so aus

# Name                           Isin            bid   ask bidsize asksize delta  stueck umsatz     avg
# ----                           ----            ---   --- ------- ------- -----  ------ ------     ---
# Beyond Air Inc.                US08862L1035   4,08  4,34     540     510 +0,95%     28    118    4,23
# Beyond Meat Inc.               US08862E1091  86,97 87,99      40      40 -0,68%  10379 921186 88,7548
# Beyond Medical Technolog. Inc. CA0886411051 0,0594  0,07   68000   58000 0,00%       0      0     ./.     
```
## Related Links


## Something Funny

![ruthe/0481.jpg](../../../doc/resource/comics/ruthe/0481.jpg)

---
## PlainText Hilfe

```

NAME
    Get-TradeGateValues
    
SYNOPSIS
    Zeigt die aktuellen Werte einer oder mehrerer Aktien an
    
    
SYNTAX
    Get-TradeGateValues [[-Index] <Object>] [<CommonParameters>]
    
    
DESCRIPTION
    Zeigt die aktuellen Werte einer oder mehrerer Aktien an
    

PARAMETERS
    -Index <Object>
        Index Objekt das mit Get-TradeGateIndizes geholt wurde
        oder eine ISIN (als ID)
        
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
    
    PS > Get-TradeGateValues -Index (Get-TradeGateIndex -Name Beyond*) | Format-Table -AutoSize
    
    # Sieht dann z.B. so aus
    
    # Name                           Isin            bid   ask bidsize asksize delta  stueck umsatz     avg
    # ----                           ----            ---   --- ------- ------- -----  ------ ------     ---
    # Beyond Air Inc.                US08862L1035   4,08  4,34     540     510 +0,95%     28    118    4,23
    # Beyond Meat Inc.               US08862E1091  86,97 87,99      40      40 -0,68%  10379 921186 88,7548
    # Beyond Medical Technolog. Inc. CA0886411051 0,0594  0,07   68000   58000 0,00%       0      0     ./.
    
    
    
    
    
RELATED LINKS


```

