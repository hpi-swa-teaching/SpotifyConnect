Class {
	#name : #SPOCApiPlayer,
	#superclass : #SPOCApiEndpoint,
	#category : #SpotifyConnect
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/25/2024 15:34'
}
SPOCApiPlayer class >> getAccessToken [

	^ 'BQDnV7sO6OZRzBsccOhlawP_3fDj_-dYJPqKihlTm1Ql3TzYwcUPxXOtkk-YLVQe1oZ3HWF3FML6GWkjmoPZp_XD7RUVcXQCX6ZnU1gegeWAjh5G6icJXMM-ry-z9QkXAD2mzslHiH3NQ6Q07TDaK5j6lHcMuUz0T12t141y4_GRy_bDOHiHJnT4raEJcCElQllBhDadpkNDl17NiUZiG0BZgtc8C6sUiSGjXc2U1Zd_'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/22/2024 13:49'
}
SPOCApiPlayer >> endpoint [
	^ 'v1/me/player/'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/22/2024 13:50'
}
SPOCApiPlayer >> endpointMethod [
	^ 'GET'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/25/2024 14:01'
}
SPOCApiPlayer >> executeRequest: request withParams: aParamDictionary [

	request rawUrl: (request rawUrl,'?additional_types=', (aParamDictionary at: 'additional_types')).
	Transcript showln: request.
	^ self client sendRequest: request
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/22/2024 14:10'
}
SPOCApiPlayer >> executeTest [

	^ '{
  "device": {
    "id": "string",
    "is_active": false,
    "is_private_session": false,
    "is_restricted": false,
    "name": "Kitchen speaker",
    "type": "computer",
    "volume_percent": 59,
    "supports_volume": false
  },
  "repeat_state": "string",
  "shuffle_state": false,
  "context": {
    "type": "string",
    "href": "string",
    "external_urls": {
      "spotify": "string"
    },
    "uri": "string"
  },
  "timestamp": 0,
  "progress_ms": 0,
  "is_playing": false,
  "item": {
    "album": {
      "album_type": "compilation",
      "total_tracks": 9,
      "available_markets": [
        "CA",
        "BR",
        "IT"
      ],
      "external_urls": {
        "spotify": "string"
      },
      "href": "string",
      "id": "2up3OPMp9Tb4dAKM2erWXQ",
      "images": [
        {
          "url": "https://i.scdn.co/image/ab67616d00001e02ff9ca10b55ce82ae553c8228",
          "height": 300,
          "width": 300
        }
      ],
      "name": "string",
      "release_date": "1981-12",
      "release_date_precision": "year",
      "restrictions": {
        "reason": "market"
      },
      "type": "album",
      "uri": "spotify:album:2up3OPMp9Tb4dAKM2erWXQ",
      "artists": [
        {
          "external_urls": {
            "spotify": "string"
          },
          "href": "string",
          "id": "string",
          "name": "string",
          "type": "artist",
          "uri": "string"
        }
      ]
    },
    "artists": [
      {
        "external_urls": {
          "spotify": "string"
        },
        "followers": {
          "href": "string",
          "total": 0
        },
        "genres": [
          "Prog rock",
          "Grunge"
        ],
        "href": "string",
        "id": "string",
        "images": [
          {
            "url": "https://i.scdn.co/image/ab67616d00001e02ff9ca10b55ce82ae553c8228",
            "height": 300,
            "width": 300
          }
        ],
        "name": "string",
        "popularity": 0,
        "type": "artist",
        "uri": "string"
      }
    ],
    "available_markets": [
      "string"
    ],
    "disc_number": 0,
    "duration_ms": 0,
    "explicit": false,
    "external_ids": {
      "isrc": "string",
      "ean": "string",
      "upc": "string"
    },
    "external_urls": {
      "spotify": "string"
    },
    "href": "string",
    "id": "string",
    "is_playable": false,
    "linked_from": {},
    "restrictions": {
      "reason": "string"
    },
    "name": "string",
    "popularity": 0,
    "preview_url": "string",
    "track_number": 0,
    "type": "track",
    "uri": "string",
    "is_local": false
  },
  "currently_playing_type": "string",
  "actions": {
    "interrupting_playback": false,
    "pausing": false,
    "resuming": false,
    "seeking": false,
    "skipping_next": false,
    "skipping_prev": false,
    "toggling_repeat_context": false,
    "toggling_shuffle": false,
    "toggling_repeat_track": false,
    "transferring_playback": false
  }
}' readStream
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/22/2024 14:06'
}
SPOCApiPlayer >> tinkerReponseContent: aContentStream [
	
	^ Json readFrom: aContentStream
	
]
