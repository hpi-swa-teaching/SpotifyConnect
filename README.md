# SpotifyConnect

[![CI](https://github.com/hpi-swa-teaching/SpotifyConnect/workflows/CI/badge.svg)](https://github.com/hpi-swa-teaching/SpotifyConnect/actions)

## Setup Anleitung
### Spotify Developer Account anlegen
Um die Spotify Connect App in Squeak zu benutzen wird ein Spotify Developer Account benötigt. Es sind folgende Schritte nötig
1. Auf https://developer.spotify.com registrieren
2. Über "Create App" auf dem Dashboard eine neue App erstellen
3. Name und Beschreibung beliebig wählen
4. Diese Redirect URI hinzufügen: ```http://localhost:8080/callback```
5. Checkbox bei "Web API" und den Terms of Service von SPotify setzen und speichern

### Abhängigkeiten in Squeak installieren

Als erstes folgenden Code in einem Workspace ausführen:
```smalltalk
Metacello new
  configuration: 'FFI';
  load.
```
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

### Projekt clonen
Im Git Browser dieses Repository clonen

### App öffnen und anmelden

Unter ```Apps``` ist nun ```Spotify Connect``` verfügbar.

Zum Benutzen der App in Squeak ist das Anmelden mit dem Spotify Account nötig, mit welchem auch die App im Spotify Developer Dashboard im ersten Schritt erstellt wurde. 

Beim erstmaligen Login werden Cliend ID und Client Secret von jeweils einem Pop-Up abgefragt. Diese müssen aus den Settings des Spotify Developer Dashbords kopiert werden.

Dann öffnet sich der Browser (außerhalb von Squeak) und leitet automatisch zur Anmeldeseite von Spotify. Nach erfolgreichem Anmelden kann die Spotify App in Squeak benutzt werden. 

Für die meisten Features erfordert Spotify allerdings einen Premium Account.
