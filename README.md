# SpotifyConnect

[![CI](https://github.com/hpi-swa-teaching/SpotifyConnect/workflows/CI/badge.svg)](https://github.com/hpi-swa-teaching/SpotifyConnect/actions)

## Setup Anleitung
### Spotify Developer Account anlegen
- Auf https://developer.spotify.com registrieren
- Eine neue App erstellen
- Name und Beschreibung beliebig wählen
- Redirect URI hinzufügen: http://localhost:8080/callback

### Abhängigkeiten in Squeak installieren

In einem Workspace ausführen:
```
Metacello new
  configuration: 'FFI';
  load.
```

Tools -> Monticello Browser -> +Repository -> HTTP -> Code kopieren ->
```
MCHttpRepository
  location: 'http://www.squeaksource.com/ExternalWebBrowser'
  user: ''
  password: ''
```

Neues Repository auswählen -> Load -> Version 'ExternalWebBrowser-mtf.114' wählen -> Load -> Image Neustarten

### Projekt clonen
Im Git Browser dieses Repository clonen

### App öffnen und anmelden

Apps -> Spotify Connect

Beim erstmaligen Login werden Cliend ID und Client Secret aus den Settings des Spotify Developer Dashbords in einem Popup abgefragt.

Dann öffnet der Login den Browser und leitet automatisch zur Anmeldeseite von Spotify. Nach erfolgreichem Anmelden kann die Spotify App in Squeak benutzt werden.
