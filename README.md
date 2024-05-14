# SpotifyConnect
Spotify Connect

# Dependencies
In einem Workspace ausführen:
```
Metacello new
  configuration: 'FFI';
  load.
```

```
Metacello new
  baseline: 'AutoTDD';
  repository: 'github://hpi-swa-teaching/AutoTDD:master/packages';
  onConflict: [:ex | ex allow];
  load
```

## ExternalWebBrowser 
![http://www.squeaksource.com/@7-eJgvTOeyYovTSM/B1s5wNGT](http://www.squeaksource.com/@7-eJgvTOeyYovTSM/B1s5wNGT)
```
MCHttpRepository
  location: 'http://www.squeaksource.com/ExternalWebBrowser'
  user: ''
  password: ''
```
Tools -> Monticello Browser -> +Repository -> HTTP -> Code kopieren -> Neues Repository auswählen -> Load -> Version 'ExternalWebBrowser-mtf.114' wählen -> Load
- Hat noch Probleme unter Windows 11 und Linux
