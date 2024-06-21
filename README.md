# SpotifyConnect

[![CI](https://github.com/hpi-swa-teaching/SpotifyConnect/workflows/CI/badge.svg)](https://github.com/hpi-swa-teaching/SpotifyConnect/actions)

## Setup Anleitung
### Spotify Developer Account anlegen
- Mit einem Spotify-Konto im Developer Dashboard anmelden.
- Eine App erstellen und „Web-API“ auf die Frage, welche APIs verwenden werden auswählen.
- Name und Beschreibung beliebig wählen
- Redirect URI hinzufügen: http://localhost:8080/callback
- Client Secret und Client ID aus den Settings der App an einen sicheren Ort kopieren

### Abhängigkeiten in Squeak installieren
#### FFI Installieren
In einem Workspace ausführen:
```
Metacello new
  configuration: 'FFI';
  load.
```
#### ExternalWebBrowser installieren
Tools -> Monticello Browser -> +Repository -> HTTP -> Code kopieren ->
```
MCHttpRepository
  location: 'http://www.squeaksource.com/ExternalWebBrowser'
  user: ''
  password: ''
```
Neues Repository auswählen -> Load -> Version 'ExternalWebBrowser-mtf.114' wählen -> Load -> Image Neustarten

### Projekt clonen oder .sar Installieren
Im Git Browser dieses Repository clonen oder die .sar durch Drag-and-Drop oder via. Tools -> FileList installieren 

### App öffnen und anmelden
Apps -> Spotify Connect

Beim erstmaligen Login werden Cliend ID und Client Secret aus den Settings des Spotify Developer Dashbords in einem Popup abgefragt.

Durch den Login-Button offnet sich ein Browser und leitet automatisch zur Anmeldeseite von Spotify. Nach erfolgreichem Anmelden kann die Spotify App in Squeak benutzt werden. Dabei ist sicherzustellen, dass eine Spotify-Gerät (also z.b. die Spotify-Desktop-App) aktiv ist. Dafür Spotify auf einem Gerät öffnen und einmal einen Song anspielen.
