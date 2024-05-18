Class {
	#name : #SPOCApiSearch,
	#superclass : #SPOCApiEndpoint,
	#category : #SpotifyConnect
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 5/16/2024 19:01'
}
SPOCApiSearch >> endpoint [
	^ 'v1/search'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 5/16/2024 18:51'
}
SPOCApiSearch >> endpointMethod [
	^ 'GET'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 5/16/2024 23:05'
}
SPOCApiSearch >> executeRequest: request withParams: aParameterDictionary [

	request rawUrl: (request rawUrl, '?q=', (aParameterDictionary at: 'input'), '&type=', (aParameterDictionary at: 'type'), '&limit=', (aParameterDictionary at: 'limit')).
	^ self client sendRequest: request
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 5/16/2024 19:05'
}
SPOCApiSearch >> executeTest [
^ '{
  "tracks": {
    "href": "https://api.spotify.com/v1/search?query=Morning+Blue&type=track&locale=de%2Cen-US%3Bq%3D0.7%2Cen%3Bq%3D0.3&offset=0&limit=1",
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
      }
    ],
    "limit": 1,
    "next": "https://api.spotify.com/v1/search?query=Morning+Blue&type=track&locale=de%2Cen-US%3Bq%3D0.7%2Cen%3Bq%3D0.3&offset=1&limit=1",
    "offset": 0,
    "previous": null,
    "total": 802
  }
}' readStream
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 5/17/2024 09:51'
}
SPOCApiSearch >> tinkerReponseContent: aContentStream [
	
	| content tracks trackItems |
	content := Json readFrom: aContentStream readStream.
	Transcript showln: content.
	tracks := OrderedCollection new.
	trackItems := (content at: #tracks) at: #items.
	trackItems do: [ :trackItem |
		| artists artistItems album albumItem track |
		artists := OrderedCollection new.
		artistItems := (trackItem at: #artists).
		artistItems do: [ :artistItem |
			| artist |
			artist := SPOCArtist new.
			artist
				id: (artistItem at: #id);
				name: (artistItem at: #name).
			artists add: artist			
		].
		album := SPOCAlbum new.
		albumItem := (trackItem at: #album).
		album
			id: (albumItem at: #id);
			name: (albumItem at: #name).
		track := SPOCTrack new.
		track
			id: (trackItem at: #id);
			name: (trackItem at: #name);
			artists: artists;
			album: album;
			duration: (trackItem at: #duration_ms) // 1000;
			explicit: (trackItem at: #explicit);
			popularity: (trackItem at: #popularity);
			trackNumber: (trackItem at: #track_number).
		tracks add: track
	].
	^ tracks
]
