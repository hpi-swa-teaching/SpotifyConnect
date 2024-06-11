Class {
	#name : #SPOCTestTinkerResponseContent,
	#superclass : #TestCase,
	#instVars : [
		'album',
		'apiEndpoint',
		'artist',
		'device',
		'playbackState',
		'track'
	],
	#category : #'SpotifyConnect-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 23:50'
}
SPOCTestTinkerResponseContent >> album [

	^ album
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 23:50'
}
SPOCTestTinkerResponseContent >> album: anObject [

	album := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/11/2024 00:08'
}
SPOCTestTinkerResponseContent >> apiEndpoint [

	^ apiEndpoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/11/2024 00:08'
}
SPOCTestTinkerResponseContent >> apiEndpoint: anObject [

	apiEndpoint := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 23:50'
}
SPOCTestTinkerResponseContent >> artist [

	^ artist
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 23:50'
}
SPOCTestTinkerResponseContent >> artist: anObject [

	artist := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 23:50'
}
SPOCTestTinkerResponseContent >> device [

	^ device
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 23:50'
}
SPOCTestTinkerResponseContent >> device: anObject [

	device := anObject
]

{
	#category : #mocks,
	#'squeak_changestamp' : 'TL 6/11/2024 00:02'
}
SPOCTestTinkerResponseContent >> mockAlbum [

	^ '{
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
		    }'
]

{
	#category : #mocks,
	#'squeak_changestamp' : 'TL 6/11/2024 00:03'
}
SPOCTestTinkerResponseContent >> mockArtist [

	^ '{
	          "external_urls": {
	            "spotify": "https://open.spotify.com/artist/1c3uso4iIeeX3P0bhKaQDq"
	          },
	          "href": "https://api.spotify.com/v1/artists/1c3uso4iIeeX3P0bhKaQDq",
	          "id": "1c3uso4iIeeX3P0bhKaQDq",
	          "name": "Jaxomy",
	          "type": "artist",
	          "uri": "spotify:artist:1c3uso4iIeeX3P0bhKaQDq"
	        }'
]

{
	#category : #mocks,
	#'squeak_changestamp' : 'TL 6/11/2024 00:03'
}
SPOCTestTinkerResponseContent >> mockDevice [

	^ '{
		    "id": "b704b454bce64526992a3f207723032f5f91e635",
		    "is_active": true,
		    "is_private_session": false,
		    "is_restricted": false,
		    "name": "TL-04",
		    "supports_volume": true,
		    "type": "Computer",
		    "volume_percent": 100
		  }'
]

{
	#category : #mocks,
	#'squeak_changestamp' : 'TL 6/10/2024 23:49'
}
SPOCTestTinkerResponseContent >> mockPlaybackState [

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
		}'
]

{
	#category : #mocks,
	#'squeak_changestamp' : 'TL 6/11/2024 11:19'
}
SPOCTestTinkerResponseContent >> mockTrack [

	^ '{
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
		  }'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 23:50'
}
SPOCTestTinkerResponseContent >> playbackState [

	^ playbackState
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 23:50'
}
SPOCTestTinkerResponseContent >> playbackState: anObject [

	playbackState := anObject
]

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/11/2024 00:08'
}
SPOCTestTinkerResponseContent >> setUp [

	self apiEndpoint: SPOCApiEndpoint new;
		setUpAlbum;
		setUpArtist;
		setUpDevice;
		setUpPlaybackState;
		setUpTrack
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/11/2024 00:11'
}
SPOCTestTinkerResponseContent >> setUpAlbum [

	self album: (SPOCAlbum new
			id: '48lxT5qJF0yYyf2z4wB4xW';
			name: 'Pedro';
			image: nil;
			
			yourself)
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/11/2024 00:11'
}
SPOCTestTinkerResponseContent >> setUpArtist [

	self track: (SPOCArtist new
			id: '48lxT5qJF0yYyf2z4wB4xW';
			name: 'Pedro';
			image: nil;
			
			yourself)
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/11/2024 11:56'
}
SPOCTestTinkerResponseContent >> setUpDevice [

	self device: (SPOCDevice new
			id: 'b704b454bce64526992a3f207723032f5f91e635';
			isActive: true;
			name: 'TL-04';
			supportsVolume: true;
			type: 'Computer';
			volume: 100;
			yourself)
]

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/11/2024 00:11'
}
SPOCTestTinkerResponseContent >> setUpPlaybackState [

	
	
]

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/11/2024 12:08'
}
SPOCTestTinkerResponseContent >> setUpTrack [

	self track: (SPOCTrack new
			id: '48lxT5qJF0yYyf2z4wB4xW';
			name: 'Pedro';
			image: nil;
			album: nil;
			artists: nil;
			duration: 144;
			trackNumber: 1;
			yourself)
	
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/11/2024 11:56'
}
SPOCTestTinkerResponseContent >> testTinkerDevice [

	| content res |
	content := Json readFrom: self mockDevice readStream.
	res := self apiEndpoint tinkerDevice: content.
	self assert: (res equals: self device)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/11/2024 00:12'
}
SPOCTestTinkerResponseContent >> testTinkerPlaybackState [

	| content res |
	content := Json readFrom: self mockPlaybackState readStream.
	res := self apiEndpoint tinkerPlaybackState: content.
	self assert: true" res equals: self playbackState"
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/11/2024 11:52'
}
SPOCTestTinkerResponseContent >> testTinkerTrack [

	| content res |
	content := Json readFrom: self mockTrack readStream.
	res := self apiEndpoint tinkerTrack: content.
	res image: nil;
		album: nil;
		artists: nil.
	self assert: (res equals: self track)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 23:50'
}
SPOCTestTinkerResponseContent >> track [

	^ track
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 23:50'
}
SPOCTestTinkerResponseContent >> track: anObject [

	track := anObject
]
