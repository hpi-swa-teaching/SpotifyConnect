<p align="center"><img src="/assets/SpotifyConnectInSqueak.png" width="200"></p>

# Spotify Connect

[![CI](https://github.com/hpi-swa-teaching/SpotifyConnect/workflows/CI/badge.svg)](https://github.com/hpi-swa-teaching/SpotifyConnect/actions)
![Squeakversion](https://img.shields.io/badge/Squeak%20Version-6.0-green)
![Coverage](https://img.shields.io/badge/Coverage-84-green)

## Features
- Anmelden mit einem Spotify Konto
- Abspielen und Pausieren von Songs
- Skippen zu vorherigem oder nächsten Song
- Aktuell wiedergegebener Song wird mit Bild und Titel angezeigt
- Suche nach Songs, Albums und Playlists filtern
- Suchergebnisse mit Bild als Liste  ansehen
- Liste der zuletzt wiedergegebenen Songs ansehen
- Aktives Wiedergabegerät anzeigen und wechseln
- Lautstärke ändern und Wiedergabe muten
- Manuelles Aktualisieren des Interfaces
- Anwendung über das Apps Menü in Squeak öffnen

## Voraussetzungen
- Für die meisten Features erfordert Spotify einen Premium Account
- Es muss sichergestellt sein, dass ein Spotify-Gerät des Accounts aktiv ist, da Spotify-Connect eine Wiedergabe steuert jedoch nicht selber die Musik streamt. Dafür kann Spotify auf Desktop, Mobiltelefon, o.Ä. geöffnet und einen Track angespielt werden.

## Setup Anleitung
### Spotify Developer Account anlegen
Um die Spotify Connect App in Squeak zu benutzen wird ein Spotify Developer Account benötigt. Es sind folgende Schritte nötig
1. Auf https://developer.spotify.com registrieren
2. Über "Create App" auf dem Dashboard eine neue App erstellen
4. Name und Beschreibung beliebig wählen
5. Diese Redirect URI hinzufügen: ```http://localhost:8080/callback```
6. Checkbox bei "Web API" und den Terms of Service von Spotify setzen und speichern

### Abhängigkeiten in Squeak installieren
#### FFI Installieren
Als erstes folgenden Code in einem Workspace ausführen:
```smalltalk
Metacello new
  configuration: 'FFI';
  load.
```

#### ExternalWebBrowser Installieren
Anschließend über ```Tools``` in den ```Monticello Browser``` gehen.
Dort ```+Repository``` und den Typ ```HTTP``` wählen und folgenden Code einfügen:

```smalltalk
MCHttpRepository
  location: 'http://www.squeaksource.com/ExternalWebBrowser'
  user: ''
  password: ''
```

Neues Repository ```ExternalWebBrowser``` auswählen und ```Open``` klicken. Die neuste Version wählen und ```Load```.

**Wichtig**: Squeak Image neustarten!

### Projekt clonen oder `.sar`-Datei installieren
Entweder im Git Browser dieses Repository clonen oder eine `.sar`-Datei via Drag-and-Drop oder mittels `Tools` und `File List` installieren.

### App öffnen und Anmelden

Unter ```Apps``` ist nun ```Spotify Connect``` verfügbar und kann dort gestartet werden. Es ist wichtig, dass nur ein Squeak-Image geöffnet ist, wenn Spotify Connect verwendet werden soll.

Zum Benutzen der App in Squeak ist das Anmelden mit dem Spotify Account nötig, mit welchem auch die App im Spotify Developer Dashboard im ersten Schritt erstellt wurde. 

Beim erstmaligen Login werden Cliend ID und Client Secret von jeweils einem Pop-Up abgefragt. Diese müssen aus den Settings des Spotify Developer Dashbords kopiert werden.

Dann öffnet sich der Browser (außerhalb von Squeak) und leitet automatisch zur Anmeldeseite von Spotify. Nach erfolgreichem Anmelden und Aktivieren eines Gerätes kann Spotify Connect in Squeak benutzt werden.

## Screenshot

<p align="center"><img src="/assets/Screenshot.png" ></p>
