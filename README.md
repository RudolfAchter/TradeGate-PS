# TradeGate-PS

Dies ist ein Powershell Modul mit dessen Hilfe man Aktien-Daten von tradegate.de via Powershell abrufen kann.
Hierdurch können z.B. automatisiert Benachrichtigungen bei Aktien Preisentwicklungen erstellt werden.


## Beispiel

Das Modul macht so etwas hier:

```powershell
Get-TradeGateValues -Index (Get-TradeGateIndex -Name Beyond*) | Format-Table -AutoSize
```

```text
Name                           Isin            bid   ask bidsize asksize delta  stueck umsatz     avg
----                           ----            ---   --- ------- ------- -----  ------ ------     ---
Beyond Air Inc.                US08862L1035   4,08  4,34     540     510 +0,95%     28    118    4,23
Beyond Meat Inc.               US08862E1091  86,97 87,99      40      40 -0,68%  10379 921186 88,7548
Beyond Medical Technolog. Inc. CA0886411051 0,0594  0,07   68000   58000 0,00%       0      0     ./.
```

Mit den zurückgegebenen Objekten könnt ihr dann alles weitere anstellen was die Powershell ermöglicht z.B.

```powershell
Get-TradeGateValues -Index (Get-TradeGateIndex -Name Beyond*) | ConvertTo-Json        
```

```text
[
  {
    "Name": "Beyond Air Inc.",
    "Isin": "US08862L1035",
    "bid": 4.08,
    "ask": 4.34,
    "bidsize": 540,
    "asksize": 510,
    "delta": "+0,95%",
    "stueck": 28,
    "umsatz": 118,
    "avg": 4.23,
    "last": 4.23,
    "high": 4.23,
    "low": 4.23
  },
  {
    "Name": "Beyond Meat Inc.",
    "Isin": "US08862E1091",
    "bid": 86.97,
    "ask": 87.99,
    "bidsize": 40,
    "asksize": 40,
    "delta": "-0,68%",
    "stueck": 10379,
    "umsatz": 921186,
    "avg": 88.7548,
    "last": 87.37,
    "high": 89.99,
    "low": 87.37
  },
  {
    "Name": "Beyond Medical Technolog. Inc.",
    "Isin": "CA0886411051",
    "bid": "0,0594",
    "ask": "0,07",
    "bidsize": 68000,
    "asksize": 58000,
    "delta": "0,00%",
    "stueck": 0,
    "umsatz": 0,
    "avg": "./.",
    "last": "./.",
    "high": "./.",
    "low": "./."
  }
]
```



## Installation

Projekt ist in meinem Fall für OpenHab am Raspberr gedacht. Deswegen siehe auch:
- [Installieren von Powershell unter Linux](https://docs.microsoft.com/de-de/powershell/scripting/install/installing-powershell-core-on-linux?view=powershell-7.1)
- Und [Installieren eines Powershell-Modules](https://docs.microsoft.com/de-de/powershell/scripting/developer/module/installing-a-powershell-module?view=powershell-7.1)

## Verwendung

Siehe [Index File](TradeGate/INDEX.md)