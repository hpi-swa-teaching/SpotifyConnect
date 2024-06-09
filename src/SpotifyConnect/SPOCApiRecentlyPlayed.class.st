Class {
	#name : #SPOCApiRecentlyPlayed,
	#superclass : #SPOCApiEndpoint,
	#category : #SpotifyConnect
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 6/1/2024 22:32'
}
SPOCApiRecentlyPlayed >> endpoint [

	^ 'v1/me/player/recently-played'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 6/1/2024 12:25'
}
SPOCApiRecentlyPlayed >> endpointMethod [	

	^ 'GET'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 6/1/2024 22:30'
}
SPOCApiRecentlyPlayed >> executeRequest: request withParams: aParameterDictionary [

	request rawUrl: (request rawUrl, '?limit=', (aParameterDictionary at: 'limit'), '&after=', (aParameterDictionary at: 'after')).
	^ self client sendRequest: request
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 5/28/2024 17:49'
}
SPOCApiRecentlyPlayed >> executeTest [
	
	^'{
  "href": "string",
  "limit": 0,
  "next": "string",
  "cursors": {
    "after": "string",
    "before": "string"
  },
  "total": 0,
  "items": [
    {
      "track": {
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
            "AR",
            "AU",
            "AT",
            "BE",
            "BO",
            "BR",
            "BG",
            "CA",
            "CL",
            "CO",
            "CR",
            "CY",
            "CZ",
            "DK",
            "DO",
            "DE",
            "EC",
            "EE",
            "SV",
            "FI",
            "FR",
            "GR",
            "GT",
            "HN",
            "HK",
            "HU",
            "IS",
            "IE",
            "IT",
            "LV",
            "LT",
            "LU",
            "MY",
            "MT",
            "MX",
            "NL",
            "NZ",
            "NI",
            "NO",
            "PA",
            "PY",
            "PE",
            "PH",
            "PL",
            "PT",
            "SG",
            "SK",
            "ES",
            "SE",
            "CH",
            "TW",
            "TR",
            "UY",
            "US",
            "GB",
            "AD",
            "LI",
            "MC",
            "ID",
            "JP",
            "TH",
            "VN",
            "RO",
            "IL",
            "ZA",
            "SA",
            "AE",
            "BH",
            "QA",
            "OM",
            "KW",
            "EG",
            "MA",
            "DZ",
            "TN",
            "LB",
            "JO",
            "PS",
            "IN",
            "KZ",
            "MD",
            "UA",
            "AL",
            "BA",
            "HR",
            "ME",
            "MK",
            "RS",
            "SI",
            "KR",
            "BD",
            "PK",
            "LK",
            "GH",
            "KE",
            "NG",
            "TZ",
            "UG",
            "AG",
            "AM",
            "BS",
            "BB",
            "BZ",
            "BT",
            "BW",
            "BF",
            "CV",
            "CW",
            "DM",
            "FJ",
            "GM",
            "GE",
            "GD",
            "GW",
            "GY",
            "HT",
            "JM",
            "KI",
            "LS",
            "LR",
            "MW",
            "MV",
            "ML",
            "MH",
            "FM",
            "NA",
            "NR",
            "NE",
            "PW",
            "PG",
            "WS",
            "SM",
            "ST",
            "SN",
            "SC",
            "SL",
            "SB",
            "KN",
            "LC",
            "VC",
            "SR",
            "TL",
            "TO",
            "TT",
            "TV",
            "VU",
            "AZ",
            "BN",
            "BI",
            "KH",
            "CM",
            "TD",
            "KM",
            "GQ",
            "SZ",
            "GA",
            "GN",
            "KG",
            "LA",
            "MO",
            "MR",
            "MN",
            "NP",
            "RW",
            "TG",
            "UZ",
            "ZW",
            "BJ",
            "MG",
            "MU",
            "MZ",
            "AO",
            "CI",
            "DJ",
            "ZM",
            "CD",
            "CG",
            "IQ",
            "LY",
            "TJ",
            "VE",
            "ET",
            "XK"
          ],
          "external_urls": {
            "spotify": "https://open.spotify.com/album/4FqEHLgdiMHXboXIztMkkO"
          },
          "href": "https://api.spotify.com/v1/albums/4FqEHLgdiMHXboXIztMkkO",
          "id": "4FqEHLgdiMHXboXIztMkkO",
          "images": [
            {
              "height": 640,
              "url": "https://i.scdn.co/image/ab67616d0000b27384559fa763af6fb17d9f9683",
              "width": 640
            },
            {
              "height": 300,
              "url": "https://i.scdn.co/image/ab67616d00001e0284559fa763af6fb17d9f9683",
              "width": 300
            },
            {
              "height": 64,
              "url": "https://i.scdn.co/image/ab67616d0000485184559fa763af6fb17d9f9683",
              "width": 64
            }
          ],
          "name": "How Have You Been?",
          "release_date": "2024-02-02",
          "release_date_precision": "day",
          "total_tracks": 14,
          "type": "album",
          "uri": "spotify:album:4FqEHLgdiMHXboXIztMkkO"
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
          "AR",
          "AU",
          "AT",
          "BE",
          "BO",
          "BR",
          "BG",
          "CA",
          "CL",
          "CO",
          "CR",
          "CY",
          "CZ",
          "DK",
          "DO",
          "DE",
          "EC",
          "EE",
          "SV",
          "FI",
          "FR",
          "GR",
          "GT",
          "HN",
          "HK",
          "HU",
          "IS",
          "IE",
          "IT",
          "LV",
          "LT",
          "LU",
          "MY",
          "MT",
          "MX",
          "NL",
          "NZ",
          "NI",
          "NO",
          "PA",
          "PY",
          "PE",
          "PH",
          "PL",
          "PT",
          "SG",
          "SK",
          "ES",
          "SE",
          "CH",
          "TW",
          "TR",
          "UY",
          "US",
          "GB",
          "AD",
          "LI",
          "MC",
          "ID",
          "JP",
          "TH",
          "VN",
          "RO",
          "IL",
          "ZA",
          "SA",
          "AE",
          "BH",
          "QA",
          "OM",
          "KW",
          "EG",
          "MA",
          "DZ",
          "TN",
          "LB",
          "JO",
          "PS",
          "IN",
          "KZ",
          "MD",
          "UA",
          "AL",
          "BA",
          "HR",
          "ME",
          "MK",
          "RS",
          "SI",
          "KR",
          "BD",
          "PK",
          "LK",
          "GH",
          "KE",
          "NG",
          "TZ",
          "UG",
          "AG",
          "AM",
          "BS",
          "BB",
          "BZ",
          "BT",
          "BW",
          "BF",
          "CV",
          "CW",
          "DM",
          "FJ",
          "GM",
          "GE",
          "GD",
          "GW",
          "GY",
          "HT",
          "JM",
          "KI",
          "LS",
          "LR",
          "MW",
          "MV",
          "ML",
          "MH",
          "FM",
          "NA",
          "NR",
          "NE",
          "PW",
          "PG",
          "WS",
          "SM",
          "ST",
          "SN",
          "SC",
          "SL",
          "SB",
          "KN",
          "LC",
          "VC",
          "SR",
          "TL",
          "TO",
          "TT",
          "TV",
          "VU",
          "AZ",
          "BN",
          "BI",
          "KH",
          "CM",
          "TD",
          "KM",
          "GQ",
          "SZ",
          "GA",
          "GN",
          "KG",
          "LA",
          "MO",
          "MR",
          "MN",
          "NP",
          "RW",
          "TG",
          "UZ",
          "ZW",
          "BJ",
          "MG",
          "MU",
          "MZ",
          "AO",
          "CI",
          "DJ",
          "ZM",
          "CD",
          "CG",
          "IQ",
          "LY",
          "TJ",
          "VE",
          "ET",
          "XK"
        ],
        "disc_number": 1,
        "duration_ms": 217146,
        "explicit": false,
        "external_ids": {
          "isrc": "DECE72200590"
        },
        "external_urls": {
          "spotify": "https://open.spotify.com/track/45c4L5n0wh6KRv0SOf879S"
        },
        "href": "https://api.spotify.com/v1/tracks/45c4L5n0wh6KRv0SOf879S",
        "id": "45c4L5n0wh6KRv0SOf879S",
        "is_local": false,
        "name": "Morning Blue",
        "popularity": 59,
        "preview_url": null,
        "track_number": 11,
        "type": "track",
        "uri": "spotify:track:45c4L5n0wh6KRv0SOf879S"
	},
	"played_at": "string",
      "context": {
        "type": "string",
        "href": "string",
        "external_urls": {
          "spotify": "string"
        },
        "uri": "string"
      }
    }
  ]
}'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 6/9/2024 13:39'
}
SPOCApiRecentlyPlayed >> tinkerReponseContent: aContentStream [
	
	| content tracks trackItems |
	content := Json readFrom: aContentStream readStream.
	tracks := OrderedCollection new.
	trackItems := content at: #items.
	"For each track"
	trackItems do: [ :wholeItem |
		| artists artistItems album albumItem track trackItem |
		trackItem := wholeItem at: #track.
		album := SPOCAlbum new.
		albumItem := (trackItem at: #album).
		artists := OrderedCollection new.
		artistItems := (albumItem at: #artists).
		"For each artist"
		artistItems do: [ :artistItem |
			| artist |
			artist := SPOCArtist new.
			artist
				id: (artistItem at: #id);
				name: (artistItem at: #name).
			artists add: artist			
		].
		album
			id: (albumItem at: #id);
			name: (albumItem at: #name);
			artists: artists;
			image: (SPOCImage newWithUrl: (((albumItem at: #images) at: 1) at: #url)).
		track := SPOCTrack new.
		track
			id: (trackItem at: #id);
			name: (trackItem at: #name);
			image: album image;
			album: album;
			duration: (trackItem at: #duration_ms) // 1000;
			explicit: (trackItem at: #explicit);
			popularity: (trackItem at: #popularity);
			trackNumber: (trackItem at: #track_number);
			yourself.
		tracks add: track 
	].
	^ tracks
]
