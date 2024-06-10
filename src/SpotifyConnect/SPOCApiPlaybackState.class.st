Class {
	#name : #SPOCApiPlaybackState,
	#superclass : #SPOCApiEndpoint,
	#category : #'SpotifyConnect-API'
}

{
	#category : #parameters,
	#'squeak_changestamp' : 'TL 5/27/2024 17:06'
}
SPOCApiPlaybackState >> endpoint [

	^ 'v1/me/player'
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'TL 5/27/2024 15:49'
}
SPOCApiPlaybackState >> endpointMethod [

	^ 'GET'
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/9/2024 19:28'
}
SPOCApiPlaybackState >> executeRequest: request withParams: aParamDictionary [

	request rawUrl: (request rawUrl, '?additional_types=', (aParamDictionary at: #additional_types)).
	^ self client sendRequest: request
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/10/2024 00:05'
}
SPOCApiPlaybackState >> executeTest [

	^ '{
		  "device": {
		    "id": "b704b454bce64526992a3f207723032f5f91e635",
		    "is_active": true,
		    "is_private_session": false,
		    "is_restricted": false,
		    "name": "TL-04",
		    "supports_volume": true,
		    "type": "Computer",
		    "volume_percent": 100
		  },
		  "shuffle_state": true,
		  "smart_shuffle": false,
		  "repeat_state": "off",
		  "timestamp": 1717970140731,
		  "context": {
		    "external_urls": {
		      "spotify": "https://open.spotify.com/playlist/37i9dQZF1EVHGWrwldPRtj"
		    },
		    "href": "https://api.spotify.com/v1/playlists/37i9dQZF1EVHGWrwldPRtj",
		    "type": "playlist",
		    "uri": "spotify:playlist:37i9dQZF1EVHGWrwldPRtj"
		  },
		  "progress_ms": 66236,
		  "item": {
		    "album": {
		      "album_type": "single",
		      "artists": [
		        {
		          "external_urls": {
		            "spotify": "https://open.spotify.com/artist/1c3uso4iIeeX3P0bhKaQDq"
		          },
		          "href": "https://api.spotify.com/v1/artists/1c3uso4iIeeX3P0bhKaQDq",
		          "id": "1c3uso4iIeeX3P0bhKaQDq",
		          "name": "Jaxomy",
		          "type": "artist",
		          "uri": "spotify:artist:1c3uso4iIeeX3P0bhKaQDq"
		        },
		        {
		          "external_urls": {
		            "spotify": "https://open.spotify.com/artist/124jbwgd8Hh6LW7jAqTa8r"
		          },
		          "href": "https://api.spotify.com/v1/artists/124jbwgd8Hh6LW7jAqTa8r",
		          "id": "124jbwgd8Hh6LW7jAqTa8r",
		          "name": "Agatino Romero",
		          "type": "artist",
		          "uri": "spotify:artist:124jbwgd8Hh6LW7jAqTa8r"
		        },
		        {
		          "external_urls": {
		            "spotify": "https://open.spotify.com/artist/6EVyI0S0b1Ld2nm37m5x85"
		          },
		          "href": "https://api.spotify.com/v1/artists/6EVyI0S0b1Ld2nm37m5x85",
		          "id": "6EVyI0S0b1Ld2nm37m5x85",
		          "name": "Raffaella Carrà",
		          "type": "artist",
		          "uri": "spotify:artist:6EVyI0S0b1Ld2nm37m5x85"
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
		        "BY",
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
		        "PR",
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
		        "spotify": "https://open.spotify.com/album/5y6RXjI5VPR0RyInghTbf1"
		      },
		      "href": "https://api.spotify.com/v1/albums/5y6RXjI5VPR0RyInghTbf1",
		      "id": "5y6RXjI5VPR0RyInghTbf1",
		      "images": [
		        {
		          "height": 640,
		          "url": "https://i.scdn.co/image/ab67616d0000b27384464d902b1ebaf62775a6da",
		          "width": 640
		        },
		        {
		          "height": 300,
		          "url": "https://i.scdn.co/image/ab67616d00001e0284464d902b1ebaf62775a6da",
		          "width": 300
		        },
		        {
		          "height": 64,
		          "url": "https://i.scdn.co/image/ab67616d0000485184464d902b1ebaf62775a6da",
		          "width": 64
		        }
		      ],
		      "name": "Pedro",
		      "release_date": "2024-03-29",
		      "release_date_precision": "day",
		      "total_tracks": 1,
		      "type": "album",
		      "uri": "spotify:album:5y6RXjI5VPR0RyInghTbf1"
		    },
		    "artists": [
		      {
		        "external_urls": {
		          "spotify": "https://open.spotify.com/artist/1c3uso4iIeeX3P0bhKaQDq"
		        },
		        "href": "https://api.spotify.com/v1/artists/1c3uso4iIeeX3P0bhKaQDq",
		        "id": "1c3uso4iIeeX3P0bhKaQDq",
		        "name": "Jaxomy",
		        "type": "artist",
		        "uri": "spotify:artist:1c3uso4iIeeX3P0bhKaQDq"
		      },
		      {
		        "external_urls": {
		          "spotify": "https://open.spotify.com/artist/124jbwgd8Hh6LW7jAqTa8r"
		        },
		        "href": "https://api.spotify.com/v1/artists/124jbwgd8Hh6LW7jAqTa8r",
		        "id": "124jbwgd8Hh6LW7jAqTa8r",
		        "name": "Agatino Romero",
		        "type": "artist",
		        "uri": "spotify:artist:124jbwgd8Hh6LW7jAqTa8r"
		      },
		      {
		        "external_urls": {
		          "spotify": "https://open.spotify.com/artist/6EVyI0S0b1Ld2nm37m5x85"
		        },
		        "href": "https://api.spotify.com/v1/artists/6EVyI0S0b1Ld2nm37m5x85",
		        "id": "6EVyI0S0b1Ld2nm37m5x85",
		        "name": "Raffaella Carrà",
		        "type": "artist",
		        "uri": "spotify:artist:6EVyI0S0b1Ld2nm37m5x85"
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
		      "BY",
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
		      "PR",
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
		    "duration_ms": 144846,
		    "explicit": false,
		    "external_ids": {
		      "isrc": "DEE862400427"
		    },
		    "external_urls": {
		      "spotify": "https://open.spotify.com/track/48lxT5qJF0yYyf2z4wB4xW"
		    },
		    "href": "https://api.spotify.com/v1/tracks/48lxT5qJF0yYyf2z4wB4xW",
		    "id": "48lxT5qJF0yYyf2z4wB4xW",
		    "is_local": false,
		    "name": "Pedro",
		    "popularity": 86,
		    "preview_url": "https://p.scdn.co/mp3-preview/ab61513ea36dccfabe595028e7a0ebecf553f77f?cid=cfe923b2d660439caf2b557b21f31221",
		    "track_number": 1,
		    "type": "track",
		    "uri": "spotify:track:48lxT5qJF0yYyf2z4wB4xW"
		  },
		  "currently_playing_type": "track",
		  "actions": {
		    "disallows": {
		      "resuming": true
		    }
		  },
		  "is_playing": true
		}' readStream
]

{
	#category : #response,
	#'squeak_changestamp' : 'RK 6/9/2024 01:31'
}
SPOCApiPlaybackState >> tinkerReponseContent: aContentStream [
	
	| artists artistItems album albumItem content device deviceItem playbackState track trackItem |
	content := Json readFrom: aContentStream readStream.
	deviceItem := content at: #device.
	device := SPOCDevice new.
	device id: (deviceItem at: #id);
		isActive: (deviceItem at: #is_active);
		isPrivateSession: (deviceItem at: #is_private_session);
		isRestricted: (deviceItem at: #is_restricted);
		name: (deviceItem at: #name);
		type: (deviceItem at: #type);
		volume: (deviceItem at: #volume_percent);
		supportsVolume: (deviceItem at: #supports_volume);
		yourself.
	((content at: #currently_playing_type) = 'track')
		ifTrue: [trackItem := (content at: #item).
			albumItem := (trackItem at: #album).
			artists := OrderedCollection new.
			artistItems := (albumItem at: #artists).
			artistItems do: [ :artistItem |
				| artist |
				artist := SPOCArtist new
					id: (artistItem at: #id);
					name: (artistItem at: #name);
					yourself.
				artists add: artist			
			].
			album := SPOCAlbum new
				id: (albumItem at: #id);
				name: (albumItem at: #name);
				artists: artists;
				image: (SPOCImage newWithUrl: (((albumItem at: #images) at: 1) at: #url));
				yourself.
			track := SPOCTrack new
				id: (trackItem at: #id);
				name: (trackItem at: #name);
				image: album image;
				album: album;
				duration: (trackItem at: #duration_ms) // 1000;
				explicit: (trackItem at: #explicit);
				popularity: (trackItem at: #popularity);
				trackNumber: (trackItem at: #track_number);
				yourself.]
		ifFalse: [track := nil].
	playbackState := SPOCPlaybackState new
		device: device;
		progressMS: (content at: #progress_ms);
		isPlaying: (content at: #is_playing);
		track: track;
		yourself.
	^ playbackState
]
