Class {
	#name : #SPOCSearchbar,
	#superclass : #Object,
	#instVars : [
		'id',
		'name'
	],
	#category : #SpotifyConnect
}

{
	#category : #examples,
	#'squeak_changestamp' : 'RK 5/15/2024 12:30'
}
SPOCSearchbar >> exampleResponse [
	^ '{
  "href": "https://api.spotify.com/v1/search?query=flowers&type=track&market=DE&locale=de%2Cen-US%3Bq%3D0.7%2Cen%3Bq%3D0.3&offset=1&limit=5",
  "items": [
    {
      "album": {
        "album_type": "single",
        "artists": [
          {
            "external_urls": {
              "spotify": "https://open.spotify.com/artist/79AyR6ATpj2LTPxfb6FX50"
            },
            "href": "https://api.spotify.com/v1/artists/79AyR6ATpj2LTPxfb6FX50",
            "id": "79AyR6ATpj2LTPxfb6FX50",
            "name": "Lauren Spencer Smith",
            "type": "artist",
            "uri": "spotify:artist:79AyR6ATpj2LTPxfb6FX50"
          }
        ],
        "external_urls": {
          "spotify": "https://open.spotify.com/album/03sQVTmOjeFVi8GsSaJSNV"
        },
        "href": "https://api.spotify.com/v1/albums/03sQVTmOjeFVi8GsSaJSNV",
        "id": "03sQVTmOjeFVi8GsSaJSNV",
        "images": [
          {
            "height": 640,
            "url": "https://i.scdn.co/image/ab67616d0000b273295d21d0987dcc3d88b4e993",
            "width": 640
          },
          {
            "height": 300,
            "url": "https://i.scdn.co/image/ab67616d00001e02295d21d0987dcc3d88b4e993",
            "width": 300
          },
          {
            "height": 64,
            "url": "https://i.scdn.co/image/ab67616d00004851295d21d0987dcc3d88b4e993",
            "width": 64
          }
        ],
        "is_playable": true,
        "name": "Flowers",
        "release_date": "2022-04-14",
        "release_date_precision": "day",
        "total_tracks": 1,
        "type": "album",
        "uri": "spotify:album:03sQVTmOjeFVi8GsSaJSNV"
      },
      "artists": [
        {
          "external_urls": {
            "spotify": "https://open.spotify.com/artist/79AyR6ATpj2LTPxfb6FX50"
          },
          "href": "https://api.spotify.com/v1/artists/79AyR6ATpj2LTPxfb6FX50",
          "id": "79AyR6ATpj2LTPxfb6FX50",
          "name": "Lauren Spencer Smith",
          "type": "artist",
          "uri": "spotify:artist:79AyR6ATpj2LTPxfb6FX50"
        }
      ],
      "disc_number": 1,
      "duration_ms": 157373,
      "explicit": true,
      "external_ids": {
        "isrc": "USUG12202201"
      },
      "external_urls": {
        "spotify": "https://open.spotify.com/track/6Z165JvPnS8PYvGW8oLGLc"
      },
      "href": "https://api.spotify.com/v1/tracks/6Z165JvPnS8PYvGW8oLGLc",
      "id": "6Z165JvPnS8PYvGW8oLGLc",
      "is_local": false,
      "is_playable": true,
      "name": "Flowers",
      "popularity": 66,
      "preview_url": null,
      "track_number": 1,
      "type": "track",
      "uri": "spotify:track:6Z165JvPnS8PYvGW8oLGLc"
    },
    {
      "album": {
        "album_type": "album",
        "artists": [
          {
            "external_urls": {
              "spotify": "https://open.spotify.com/artist/79AyR6ATpj2LTPxfb6FX50"
            },
            "href": "https://api.spotify.com/v1/artists/79AyR6ATpj2LTPxfb6FX50",
            "id": "79AyR6ATpj2LTPxfb6FX50",
            "name": "Lauren Spencer Smith",
            "type": "artist",
            "uri": "spotify:artist:79AyR6ATpj2LTPxfb6FX50"
          }
        ],
        "external_urls": {
          "spotify": "https://open.spotify.com/album/1nEJIdxjw5Y6LBlWLGJzzT"
        },
        "href": "https://api.spotify.com/v1/albums/1nEJIdxjw5Y6LBlWLGJzzT",
        "id": "1nEJIdxjw5Y6LBlWLGJzzT",
        "images": [
          {
            "height": 640,
            "url": "https://i.scdn.co/image/ab67616d0000b273270a1c7644ec5a23c7d05272",
            "width": 640
          },
          {
            "height": 300,
            "url": "https://i.scdn.co/image/ab67616d00001e02270a1c7644ec5a23c7d05272",
            "width": 300
          },
          {
            "height": 64,
            "url": "https://i.scdn.co/image/ab67616d00004851270a1c7644ec5a23c7d05272",
            "width": 64
          }
        ],
        "is_playable": true,
        "name": "Mirror",
        "release_date": "2023-07-14",
        "release_date_precision": "day",
        "total_tracks": 15,
        "type": "album",
        "uri": "spotify:album:1nEJIdxjw5Y6LBlWLGJzzT"
      },
      "artists": [
        {
          "external_urls": {
            "spotify": "https://open.spotify.com/artist/79AyR6ATpj2LTPxfb6FX50"
          },
          "href": "https://api.spotify.com/v1/artists/79AyR6ATpj2LTPxfb6FX50",
          "id": "79AyR6ATpj2LTPxfb6FX50",
          "name": "Lauren Spencer Smith",
          "type": "artist",
          "uri": "spotify:artist:79AyR6ATpj2LTPxfb6FX50"
        }
      ],
      "disc_number": 1,
      "duration_ms": 157863,
      "explicit": true,
      "external_ids": {
        "isrc": "USUG12202201"
      },
      "external_urls": {
        "spotify": "https://open.spotify.com/track/2eykhwXDu6k3DqvY0LBInw"
      },
      "href": "https://api.spotify.com/v1/tracks/2eykhwXDu6k3DqvY0LBInw",
      "id": "2eykhwXDu6k3DqvY0LBInw",
      "is_local": false,
      "is_playable": true,
      "name": "Flowers",
      "popularity": 71,
      "preview_url": null,
      "track_number": 12,
      "type": "track",
      "uri": "spotify:track:2eykhwXDu6k3DqvY0LBInw"
    },
    {
      "album": {
        "album_type": "single",
        "artists": [
          {
            "external_urls": {
              "spotify": "https://open.spotify.com/artist/70Rt4lMiib6ya5azoVK51v"
            },
            "href": "https://api.spotify.com/v1/artists/70Rt4lMiib6ya5azoVK51v",
            "id": "70Rt4lMiib6ya5azoVK51v",
            "name": "TYM",
            "type": "artist",
            "uri": "spotify:artist:70Rt4lMiib6ya5azoVK51v"
          }
        ],
        "external_urls": {
          "spotify": "https://open.spotify.com/album/1N2nFU17qLgn9P6UTnG8dx"
        },
        "href": "https://api.spotify.com/v1/albums/1N2nFU17qLgn9P6UTnG8dx",
        "id": "1N2nFU17qLgn9P6UTnG8dx",
        "images": [
          {
            "height": 640,
            "url": "https://i.scdn.co/image/ab67616d0000b27396d3703b03d65d0447fed0c8",
            "width": 640
          },
          {
            "height": 300,
            "url": "https://i.scdn.co/image/ab67616d00001e0296d3703b03d65d0447fed0c8",
            "width": 300
          },
          {
            "height": 64,
            "url": "https://i.scdn.co/image/ab67616d0000485196d3703b03d65d0447fed0c8",
            "width": 64
          }
        ],
        "is_playable": true,
        "name": "Flowers",
        "release_date": "2019-04-12",
        "release_date_precision": "day",
        "total_tracks": 1,
        "type": "album",
        "uri": "spotify:album:1N2nFU17qLgn9P6UTnG8dx"
      },
      "artists": [
        {
          "external_urls": {
            "spotify": "https://open.spotify.com/artist/70Rt4lMiib6ya5azoVK51v"
          },
          "href": "https://api.spotify.com/v1/artists/70Rt4lMiib6ya5azoVK51v",
          "id": "70Rt4lMiib6ya5azoVK51v",
          "name": "TYM",
          "type": "artist",
          "uri": "spotify:artist:70Rt4lMiib6ya5azoVK51v"
        }
      ],
      "disc_number": 1,
      "duration_ms": 161684,
      "explicit": false,
      "external_ids": {
        "isrc": "TCAEE1953745"
      },
      "external_urls": {
        "spotify": "https://open.spotify.com/track/7dZFJ2wo0lCXvm1Sy2hytq"
      },
      "href": "https://api.spotify.com/v1/tracks/7dZFJ2wo0lCXvm1Sy2hytq",
      "id": "7dZFJ2wo0lCXvm1Sy2hytq",
      "is_local": false,
      "is_playable": true,
      "name": "Flowers",
      "popularity": 43,
      "preview_url": "https://p.scdn.co/mp3-preview/e9fe55008f451f53b98802b76caa8a851a7cc015?cid=cfe923b2d660439caf2b557b21f31221",
      "track_number": 1,
      "type": "track",
      "uri": "spotify:track:7dZFJ2wo0lCXvm1Sy2hytq"
    },
    {
      "album": {
        "album_type": "album",
        "artists": [
          {
            "external_urls": {
              "spotify": "https://open.spotify.com/artist/5lHDypXbNmHTDoFWpSTqXd"
            },
            "href": "https://api.spotify.com/v1/artists/5lHDypXbNmHTDoFWpSTqXd",
            "id": "5lHDypXbNmHTDoFWpSTqXd",
            "name": "Strings And Heart",
            "type": "artist",
            "uri": "spotify:artist:5lHDypXbNmHTDoFWpSTqXd"
          }
        ],
        "external_urls": {
          "spotify": "https://open.spotify.com/album/0mt5hxKggmYEIwHvPumwJB"
        },
        "href": "https://api.spotify.com/v1/albums/0mt5hxKggmYEIwHvPumwJB",
        "id": "0mt5hxKggmYEIwHvPumwJB",
        "images": [
          {
            "height": 640,
            "url": "https://i.scdn.co/image/ab67616d0000b273d643cc1539a115ef80aea385",
            "width": 640
          },
          {
            "height": 300,
            "url": "https://i.scdn.co/image/ab67616d00001e02d643cc1539a115ef80aea385",
            "width": 300
          },
          {
            "height": 64,
            "url": "https://i.scdn.co/image/ab67616d00004851d643cc1539a115ef80aea385",
            "width": 64
          }
        ],
        "is_playable": true,
        "name": "Secret Place",
        "release_date": "2023-07-13",
        "release_date_precision": "day",
        "total_tracks": 11,
        "type": "album",
        "uri": "spotify:album:0mt5hxKggmYEIwHvPumwJB"
      },
      "artists": [
        {
          "external_urls": {
            "spotify": "https://open.spotify.com/artist/5lHDypXbNmHTDoFWpSTqXd"
          },
          "href": "https://api.spotify.com/v1/artists/5lHDypXbNmHTDoFWpSTqXd",
          "id": "5lHDypXbNmHTDoFWpSTqXd",
          "name": "Strings And Heart",
          "type": "artist",
          "uri": "spotify:artist:5lHDypXbNmHTDoFWpSTqXd"
        }
      ],
      "disc_number": 1,
      "duration_ms": 154232,
      "explicit": false,
      "external_ids": {
        "isrc": "QZ2J21506705"
      },
      "external_urls": {
        "spotify": "https://open.spotify.com/track/0JwrBnTPWocLijm932rPPH"
      },
      "href": "https://api.spotify.com/v1/tracks/0JwrBnTPWocLijm932rPPH",
      "id": "0JwrBnTPWocLijm932rPPH",
      "is_local": false,
      "is_playable": true,
      "name": "flowers dressed in blue",
      "popularity": 61,
      "preview_url": "https://p.scdn.co/mp3-preview/b0d0aeed02ca7b02b0439709676f402e7ccbdf7d?cid=cfe923b2d660439caf2b557b21f31221",
      "track_number": 3,
      "type": "track",
      "uri": "spotify:track:0JwrBnTPWocLijm932rPPH"
    },
    {
      "album": {
        "album_type": "single",
        "artists": [
          {
            "external_urls": {
              "spotify": "https://open.spotify.com/artist/5FIR37Eznpe8S0fondwPd2"
            },
            "href": "https://api.spotify.com/v1/artists/5FIR37Eznpe8S0fondwPd2",
            "id": "5FIR37Eznpe8S0fondwPd2",
            "name": "Bjarne Hendrik",
            "type": "artist",
            "uri": "spotify:artist:5FIR37Eznpe8S0fondwPd2"
          }
        ],
        "external_urls": {
          "spotify": "https://open.spotify.com/album/2I2VoGHrwQ8k8RpUzJSbyd"
        },
        "href": "https://api.spotify.com/v1/albums/2I2VoGHrwQ8k8RpUzJSbyd",
        "id": "2I2VoGHrwQ8k8RpUzJSbyd",
        "images": [
          {
            "height": 640,
            "url": "https://i.scdn.co/image/ab67616d0000b273730b4691904937a427328db1",
            "width": 640
          },
          {
            "height": 300,
            "url": "https://i.scdn.co/image/ab67616d00001e02730b4691904937a427328db1",
            "width": 300
          },
          {
            "height": 64,
            "url": "https://i.scdn.co/image/ab67616d00004851730b4691904937a427328db1",
            "width": 64
          }
        ],
        "is_playable": true,
        "name": "Flowers",
        "release_date": "2023-09-07",
        "release_date_precision": "day",
        "total_tracks": 1,
        "type": "album",
        "uri": "spotify:album:2I2VoGHrwQ8k8RpUzJSbyd"
      },
      "artists": [
        {
          "external_urls": {
            "spotify": "https://open.spotify.com/artist/5FIR37Eznpe8S0fondwPd2"
          },
          "href": "https://api.spotify.com/v1/artists/5FIR37Eznpe8S0fondwPd2",
          "id": "5FIR37Eznpe8S0fondwPd2",
          "name": "Bjarne Hendrik",
          "type": "artist",
          "uri": "spotify:artist:5FIR37Eznpe8S0fondwPd2"
        }
      ],
      "disc_number": 1,
      "duration_ms": 182254,
      "explicit": false,
      "external_ids": {
        "isrc": "GX3HH2381489"
      },
      "external_urls": {
        "spotify": "https://open.spotify.com/track/67P8NxXLKkwdBx6LjzndgR"
      },
      "href": "https://api.spotify.com/v1/tracks/67P8NxXLKkwdBx6LjzndgR",
      "id": "67P8NxXLKkwdBx6LjzndgR",
      "is_local": false,
      "is_playable": true,
      "name": "Flowers",
      "popularity": 58,
      "preview_url": "https://p.scdn.co/mp3-preview/e8386bb7152b825e22e9ab9171b56e2003bbe9a3?cid=cfe923b2d660439caf2b557b21f31221",
      "track_number": 1,
      "type": "track",
      "uri": "spotify:track:67P8NxXLKkwdBx6LjzndgR"
    }
  ],
  "limit": 5,
  "next": "https://api.spotify.com/v1/search?query=flowers&type=track&market=DE&locale=de%2Cen-US%3Bq%3D0.7%2Cen%3Bq%3D0.3&offset=6&limit=5",
  "offset": 1,
  "previous": "https://api.spotify.com/v1/search?query=flowers&type=track&market=DE&locale=de%2Cen-US%3Bq%3D0.7%2Cen%3Bq%3D0.3&offset=0&limit=5",
  "total": 846
}'
]

{
	#category : #examples,
	#'squeak_changestamp' : 'RK 5/15/2024 12:31'
}
SPOCSearchbar >> exampleSearch [

	| accessToken clientId clientSecret content resp respContent url |
	clientId := '9c473461f4ae44cd9ae7ada51596118e'.
	clientSecret := 'b5d13c3441bc486288986ee2f7db08a6'.

	url := 'https://accounts.spotify.com/api/token'.
	content := 'grant_type=client_credentials&client_id=',clientId,'&client_secret=', clientSecret.
	resp := WebClient httpPost: url content: content type: 'application/x-www-form-urlencoded'.
	respContent := Json readFrom: resp content readStream.
	accessToken := respContent at: #access_token.

	url := 'https://api.spotify.com/v1/search?q=flowers&type=track&market=DE&limit=5&offset=1', '?access_token=', accessToken.
	"newurl := 'https://api.spotify.com/v1/search?q=flowers&type=track&market=DE&limit=5&offset=1'."
	resp := WebClient httpGet: url
]
