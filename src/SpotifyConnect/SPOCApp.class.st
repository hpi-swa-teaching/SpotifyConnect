Class {
	#name : #SPOCApp,
	#superclass : #Model,
	#instVars : [
		'auth',
		'userLogin',
		'searchbar',
		'resultList',
		'currentlyPlaying',
		'player'
	],
	#category : #SpotifyConnect
}

{
	#category : #constants,
	#'squeak_changestamp' : 'RK 6/7/2024 10:51'
}
SPOCApp class >> appName [

	^ 'Spotify Connect'
]

{
	#category : #start,
	#'squeak_changestamp' : 'RK 6/7/2024 10:51'
}
SPOCApp class >> minimumExtent [

	^ 1080 @ 720
]

{
	#category : #start,
	#'squeak_changestamp' : 'RK 6/7/2024 10:51'
}
SPOCApp class >> open [

	self new open
]

{
	#category : #start,
	#'squeak_changestamp' : 'RK 6/7/2024 12:18'
}
SPOCApp class >> testTrack [

	| api tracks |
	api := SPOCApiSearch new.
tracks := api tinkerReponseContent: (ReadStream on: '{
  "tracks": {
    "href": "https://api.spotify.com/v1/search?query=Heat+Up+Giant+Rooks&type=track&locale=de%2Cen-US%3Bq%3D0.7%2Cen%3Bq%3D0.3&offset=0&limit=1",
    "items": [
      {
        "album": {
          "album_type": "album",
          "artists": [
            {
              "external_urls": {
                "spotify": "https://open.spotify.com/artist/5wD0owYApRtYmjPWavWKvb"
              },
              "href": "https://api.spotify.com/v1/artists/5wD0owYApRtYmjPWavWKvb",
              "id": "5wD0owYApRtYmjPWavWKvb",
              "name": "Giant Rooks",
              "type": "artist",
              "uri": "spotify:artist:5wD0owYApRtYmjPWavWKvb"
            }
          ],
          "available_markets": [
            "AD",
            "AL",
            "AM",
            "AO",
            "AT",
            "AZ",
            "BA",
            "BE",
            "BF",
            "BG",
            "BI",
            "BJ",
            "BW",
            "BY",
            "CD",
            "CG",
            "CH",
            "CI",
            "CM",
            "CV",
            "CW",
            "CY",
            "CZ",
            "DE",
            "DJ",
            "DK",
            "DZ",
            "EE",
            "EG",
            "ES",
            "ET",
            "FI",
            "FR",
            "GA",
            "GB",
            "GE",
            "GH",
            "GM",
            "GN",
            "GQ",
            "GR",
            "GW",
            "HR",
            "HU",
            "IE",
            "IS",
            "IT",
            "KE",
            "KG",
            "KM",
            "KZ",
            "LI",
            "LR",
            "LS",
            "LT",
            "LU",
            "LV",
            "LY",
            "MA",
            "MC",
            "MD",
            "ME",
            "MG",
            "MK",
            "ML",
            "MR",
            "MT",
            "MU",
            "MW",
            "MZ",
            "NA",
            "NE",
            "NG",
            "NL",
            "NO",
            "PL",
            "PT",
            "RO",
            "RS",
            "RW",
            "SC",
            "SE",
            "SI",
            "SK",
            "SL",
            "SM",
            "SN",
            "ST",
            "SZ",
            "TD",
            "TG",
            "TJ",
            "TN",
            "TZ",
            "UA",
            "UG",
            "UZ",
            "XK",
            "ZA",
            "ZM",
            "ZW"
          ],
          "external_urls": {
            "spotify": "https://open.spotify.com/album/799I2k2TkWYZgot4HkSJXH"
          },
          "href": "https://api.spotify.com/v1/albums/799I2k2TkWYZgot4HkSJXH",
          "id": "799I2k2TkWYZgot4HkSJXH",
          "images": [
            {
              "height": 640,
              "url": "https://i.scdn.co/image/ab67616d0000b27335ec9f08a0116f5f77dbf462",
              "width": 640
            },
            {
              "height": 300,
              "url": "https://i.scdn.co/image/ab67616d00001e0235ec9f08a0116f5f77dbf462",
              "width": 300
            },
            {
              "height": 64,
              "url": "https://i.scdn.co/image/ab67616d0000485135ec9f08a0116f5f77dbf462",
              "width": 64
            }
          ],
          "name": "ROOKERY",
          "release_date": "2020-08-28",
          "release_date_precision": "day",
          "total_tracks": 12,
          "type": "album",
          "uri": "spotify:album:799I2k2TkWYZgot4HkSJXH"
        },
        "artists": [
          {
            "external_urls": {
              "spotify": "https://open.spotify.com/artist/5wD0owYApRtYmjPWavWKvb"
            },
            "href": "https://api.spotify.com/v1/artists/5wD0owYApRtYmjPWavWKvb",
            "id": "5wD0owYApRtYmjPWavWKvb",
            "name": "Giant Rooks",
            "type": "artist",
            "uri": "spotify:artist:5wD0owYApRtYmjPWavWKvb"
          }
        ],
        "available_markets": [
          "AD",
          "AL",
          "AM",
          "AO",
          "AT",
          "AZ",
          "BA",
          "BE",
          "BF",
          "BG",
          "BI",
          "BJ",
          "BW",
          "BY",
          "CD",
          "CG",
          "CH",
          "CI",
          "CM",
          "CV",
          "CW",
          "CY",
          "CZ",
          "DE",
          "DJ",
          "DK",
          "DZ",
          "EE",
          "EG",
          "ES",
          "ET",
          "FI",
          "FR",
          "GA",
          "GB",
          "GE",
          "GH",
          "GM",
          "GN",
          "GQ",
          "GR",
          "GW",
          "HR",
          "HU",
          "IE",
          "IS",
          "IT",
          "KE",
          "KG",
          "KM",
          "KZ",
          "LI",
          "LR",
          "LS",
          "LT",
          "LU",
          "LV",
          "LY",
          "MA",
          "MC",
          "MD",
          "ME",
          "MG",
          "MK",
          "ML",
          "MR",
          "MT",
          "MU",
          "MW",
          "MZ",
          "NA",
          "NE",
          "NG",
          "NL",
          "NO",
          "PL",
          "PT",
          "RO",
          "RS",
          "RW",
          "SC",
          "SE",
          "SI",
          "SK",
          "SL",
          "SM",
          "SN",
          "ST",
          "SZ",
          "TD",
          "TG",
          "TJ",
          "TN",
          "TZ",
          "UA",
          "UG",
          "UZ",
          "XK",
          "ZA",
          "ZM",
          "ZW"
        ],
        "disc_number": 1,
        "duration_ms": 182920,
        "explicit": false,
        "external_ids": {
          "isrc": "DECE72000358"
        },
        "external_urls": {
          "spotify": "https://open.spotify.com/track/2xxpA9Bd8TaKIv0RGKFr9I"
        },
        "href": "https://api.spotify.com/v1/tracks/2xxpA9Bd8TaKIv0RGKFr9I",
        "id": "2xxpA9Bd8TaKIv0RGKFr9I",
        "is_local": false,
        "name": "Heat Up",
        "popularity": 48,
        "preview_url": null,
        "track_number": 3,
        "type": "track",
        "uri": "spotify:track:2xxpA9Bd8TaKIv0RGKFr9I"
      }
    ],
    "limit": 1,
    "next": "https://api.spotify.com/v1/search?query=Heat+Up+Giant+Rooks&type=track&locale=de%2Cen-US%3Bq%3D0.7%2Cen%3Bq%3D0.3&offset=1&limit=1",
    "offset": 0,
    "previous": null,
    "total": 806
  }
}').
	^tracks at: 1
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/28/2024 14:57'
}
SPOCApp >> auth [

	^ auth
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/28/2024 14:57'
}
SPOCApp >> auth: anObject [

	auth := anObject
]

{
	#category : #ui,
	#'squeak_changestamp' : 'RK 6/7/2024 12:27'
}
SPOCApp >> bottomPanelContent [

	^ {self currentlyPlaying. self player}
]

{
	#category : #ui,
	#'squeak_changestamp' : 'RK 6/7/2024 23:53'
}
SPOCApp >> buildBottomPanel: aBuilder [

	^ SPOCPluggableTablePanelSpec new
		model: self;
		tableLayoutProperties: (TableLayoutProperties new
			hResizing: #spaceFill;
			vResizing: #shrinkWrap;
			listDirection: #leftToRight;
			listCentering: #justified;
			wrapDirection: #bottomToTop;
			cellInset: SPOCStyle defaultMargin);
		children: #bottomPanelContent
]

{
	#category : #ui,
	#'squeak_changestamp' : 'RK 6/5/2024 21:30'
}
SPOCApp >> buildCenterPanel: aBuilder [

	^ SPOCPluggableTablePanelSpec new
		model: self;
		tableLayoutProperties: (TableLayoutProperties new
			hResizing: #spaceFill;
			vResizing: #spaceFill);
		children: #centerPanelContent
]

{
	#category : #ui,
	#'squeak_changestamp' : 'RK 6/7/2024 10:50'
}
SPOCApp >> buildMainTable: aBuilder [
	
	^ SPOCPluggableTablePanelSpec new
		model: self;
		tableLayoutProperties: (TableLayoutProperties new
			listDirection: #topToBottom;
			cellInset: SPOCStyle defaultMargin;
			hResizing: #spaceFill;
			vResizing: #spaceFill);
		children: {self buildTopPanel: aBuilder.
			self buildCenterPanel: aBuilder.
			self buildBottomPanel: aBuilder.}
]

{
	#category : #ui,
	#'squeak_changestamp' : 'VE 6/3/2024 10:29'
}
SPOCApp >> buildTopPanel: aBuilder [
		
	 ^ SPOCPluggableTablePanelSpec new
		model: self;
		tableLayoutProperties: (TableLayoutProperties new
			hResizing: #spaceFill;
			vResizing: #shrinkWrap;
			listDirection: #leftToRight;
			listCentering: #justified;
			cellPositioning: #topLeft);
		children: #topPanelContent
]

{
	#category : #ui,
	#'squeak_changestamp' : 'RK 6/7/2024 10:50'
}
SPOCApp >> buildWindow: aBuilder [

	^ aBuilder pluggableWindowSpec new 
		model: self;
		label: #windowTitle;
		minimumExtent: SPOCApp minimumExtent;
		children: {self buildMainTable: aBuilder};
		yourself
]

{
	#category : #ui,
	#'squeak_changestamp' : 'VE 5/28/2024 14:57'
}
SPOCApp >> buildWith: aBuilder [

	^ aBuilder build: (self buildWindow: aBuilder)
]

{
	#category : #ui,
	#'squeak_changestamp' : 'RK 6/7/2024 10:50'
}
SPOCApp >> centerPanelContent [

	^ {self resultList}
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 12:17'
}
SPOCApp >> currentlyPlaying [

	^ currentlyPlaying
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 12:17'
}
SPOCApp >> currentlyPlaying: anObject [

	currentlyPlaying := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 6/7/2024 12:24'
}
SPOCApp >> initialize [

	super initialize.
	
	self auth: SPOCAuthorizer new; 
		registerOpenCommand;
		setupUserLogin;
		setupSearchbar;
		setUpResultList;
		setUpCurrentlyPlaying;
		setupPlayer.


]

{
	#category : #ui,
	#'squeak_changestamp' : 'VE 5/28/2024 14:57'
}
SPOCApp >> open [

	^ ToolBuilder open: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 5/30/2024 11:49'
}
SPOCApp >> player [
	^ player
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 5/30/2024 11:49'
}
SPOCApp >> player: anObject [
	player := anObject
]

{
	#category : #ui,
	#'squeak_changestamp' : 'TL 5/31/2024 17:32'
}
SPOCApp >> playerPanelContent [

	^ {self player}
]

{
	#category : #ui,
	#'squeak_changestamp' : 'RK 6/7/2024 10:51'
}
SPOCApp >> registerOpenCommand [

	TheWorldMenu registerOpenCommand: {'Spotify Connect'. {self. #open}}

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/5/2024 21:29'
}
SPOCApp >> resultList [
	^ resultList
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/5/2024 21:29'
}
SPOCApp >> resultList: aSPOCResultList [
	resultList := aSPOCResultList
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/30/2024 21:27'
}
SPOCApp >> searchbar [
	^ searchbar
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/30/2024 21:34'
}
SPOCApp >> searchbar: aSPOCSearchbar [
	searchbar := aSPOCSearchbar
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 6/8/2024 22:14'
}
SPOCApp >> setUpCurrentlyPlaying [

	self currentlyPlaying: (SPOCCurrentlyPlaying new app: self)
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 6/7/2024 11:25'
}
SPOCApp >> setUpResultList [

	self resultList: (SPOCResultList new app: self)
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/8/2024 20:23'
}
SPOCApp >> setupPlayer [

	self player: (SPOCPlayer new app: self; yourself).
	self auth registerSuccessCallback: [self player updateIsPlayingFromLogin].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 5/30/2024 21:34'
}
SPOCApp >> setupSearchbar [

	self searchbar: (SPOCSearchbar new app: self; yourself)
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 5/28/2024 21:34'
}
SPOCApp >> setupUserLogin [

	self userLogin: (SPOCUserLogin new app: self; yourself).
	self auth registerSuccessCallback: [self userLogin toggleLogout].


]

{
	#category : #ui,
	#'squeak_changestamp' : 'VE 6/3/2024 10:23'
}
SPOCApp >> topPanelContent [

	^ { self searchbar. self userLogin}
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/28/2024 19:59'
}
SPOCApp >> userLogin [
	^ userLogin
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/28/2024 19:59'
}
SPOCApp >> userLogin: anObject [
	userLogin := anObject
]

{
	#category : #ui,
	#'squeak_changestamp' : 'VE 5/28/2024 14:57'
}
SPOCApp >> windowTitle [

	^ SPOCApp appName
]
