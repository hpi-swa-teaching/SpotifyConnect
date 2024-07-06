"
concrete API endpoint for albums
"
Class {
	#name : #SPOCApiAlbum,
	#superclass : #SPOCApiEndpoint,
	#category : #'SpotifyConnect-API',
	#'squeak_changestamp' : 'OW 7/4/2024 11:58'
}

{
	#category : #parameters,
	#'squeak_changestamp' : 'TL 6/23/2024 15:54'
}
SPOCApiAlbum >> endpoint [

	^ 'v1/albums/'
]

{
	#category : #parameters,
	#'squeak_changestamp' : 'TL 6/23/2024 15:54'
}
SPOCApiAlbum >> endpointMethod [

	^ 'GET'
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 7/7/2024 01:21'
}
SPOCApiAlbum >> executeRequest: request withParams: aParameterDictionary [

	request rawUrl: (request rawUrl, (aParameterDictionary at: #id), '/tracks?limit=', SPOCStyle resultListLimit).
	^ self client sendRequest: request
]

{
	#category : #response,
	#'squeak_changestamp' : 'TL 6/23/2024 15:43'
}
SPOCApiAlbum >> executeTest [

	^ '{
		  "href": "https://api.spotify.com/v1/albums/6DEjYFkNZh67HP7R9PSZvv/tracks?offset=0&limit=3&locale=de,en-US;q%3D0.7,en;q%3D0.3",
		  "items": [
		    {
		      "artists": [
		        {
		          "external_urls": {
		            "spotify": "https://open.spotify.com/artist/06HL4z0CvFAxyc27GXpf02"
		          },
		          "href": "https://api.spotify.com/v1/artists/06HL4z0CvFAxyc27GXpf02",
		          "id": "06HL4z0CvFAxyc27GXpf02",
		          "name": "Taylor Swift",
		          "type": "artist",
		          "uri": "spotify:artist:06HL4z0CvFAxyc27GXpf02"
		        }
		      ],
		      "disc_number": 1,
		      "duration_ms": 208186,
		      "explicit": false,
		      "external_urls": {
		        "spotify": "https://open.spotify.com/track/2yLa0QULdQr0qAIvVwN6B5"
		      },
		      "href": "https://api.spotify.com/v1/tracks/2yLa0QULdQr0qAIvVwN6B5",
		      "id": "2yLa0QULdQr0qAIvVwN6B5",
		      "is_local": false,
		      "is_playable": true,
		      "name": "...Ready For It?",
		      "preview_url": "https://p.scdn.co/mp3-preview/f133e47ce7d5f768be3387758d71bc1a8a5726f5?cid=cfe923b2d660439caf2b557b21f31221",
		      "track_number": 1,
		      "type": "track",
		      "uri": "spotify:track:2yLa0QULdQr0qAIvVwN6B5"
		    },
		    {
		      "artists": [
		        {
		          "external_urls": {
		            "spotify": "https://open.spotify.com/artist/06HL4z0CvFAxyc27GXpf02"
		          },
		          "href": "https://api.spotify.com/v1/artists/06HL4z0CvFAxyc27GXpf02",
		          "id": "06HL4z0CvFAxyc27GXpf02",
		          "name": "Taylor Swift",
		          "type": "artist",
		          "uri": "spotify:artist:06HL4z0CvFAxyc27GXpf02"
		        },
		        {
		          "external_urls": {
		            "spotify": "https://open.spotify.com/artist/6eUKZXaKkcviH0Ku9w2n3V"
		          },
		          "href": "https://api.spotify.com/v1/artists/6eUKZXaKkcviH0Ku9w2n3V",
		          "id": "6eUKZXaKkcviH0Ku9w2n3V",
		          "name": "Ed Sheeran",
		          "type": "artist",
		          "uri": "spotify:artist:6eUKZXaKkcviH0Ku9w2n3V"
		        },
		        {
		          "external_urls": {
		            "spotify": "https://open.spotify.com/artist/1RyvyyTE3xzB2ZywiAwp0i"
		          },
		          "href": "https://api.spotify.com/v1/artists/1RyvyyTE3xzB2ZywiAwp0i",
		          "id": "1RyvyyTE3xzB2ZywiAwp0i",
		          "name": "Future",
		          "type": "artist",
		          "uri": "spotify:artist:1RyvyyTE3xzB2ZywiAwp0i"
		        }
		      ],
		      "disc_number": 1,
		      "duration_ms": 244826,
		      "explicit": false,
		      "external_urls": {
		        "spotify": "https://open.spotify.com/track/2x0WlnmfG39ZuDmstl9xfX"
		      },
		      "href": "https://api.spotify.com/v1/tracks/2x0WlnmfG39ZuDmstl9xfX",
		      "id": "2x0WlnmfG39ZuDmstl9xfX",
		      "is_local": false,
		      "is_playable": true,
		      "name": "End Game",
		      "preview_url": "https://p.scdn.co/mp3-preview/908f388e5550f9d6d940ef721eb6d302770f0117?cid=cfe923b2d660439caf2b557b21f31221",
		      "track_number": 2,
		      "type": "track",
		      "uri": "spotify:track:2x0WlnmfG39ZuDmstl9xfX"
		    },
		    {
		      "artists": [
		        {
		          "external_urls": {
		            "spotify": "https://open.spotify.com/artist/06HL4z0CvFAxyc27GXpf02"
		          },
		          "href": "https://api.spotify.com/v1/artists/06HL4z0CvFAxyc27GXpf02",
		          "id": "06HL4z0CvFAxyc27GXpf02",
		          "name": "Taylor Swift",
		          "type": "artist",
		          "uri": "spotify:artist:06HL4z0CvFAxyc27GXpf02"
		        }
		      ],
		      "disc_number": 1,
		      "duration_ms": 238253,
		      "explicit": false,
		      "external_urls": {
		        "spotify": "https://open.spotify.com/track/4svZDCRz4cJoneBpjpx8DJ"
		      },
		      "href": "https://api.spotify.com/v1/tracks/4svZDCRz4cJoneBpjpx8DJ",
		      "id": "4svZDCRz4cJoneBpjpx8DJ",
		      "is_local": false,
		      "is_playable": true,
		      "name": "I Did Something Bad",
		      "preview_url": "https://p.scdn.co/mp3-preview/ef43901885fc52988f3192152a8019fc7a34f0d5?cid=cfe923b2d660439caf2b557b21f31221",
		      "track_number": 3,
		      "type": "track",
		      "uri": "spotify:track:4svZDCRz4cJoneBpjpx8DJ"
		    }
		  ],
		  "limit": 3,
		  "next": "https://api.spotify.com/v1/albums/6DEjYFkNZh67HP7R9PSZvv/tracks?offset=3&limit=3&locale=de,en-US;q%3D0.7,en;q%3D0.3",
		  "offset": 0,
		  "previous": null,
		  "total": 15
		}' readStream
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/24/2024 05:21'
}
SPOCApiAlbum >> getAlbumWithID: aString [

	^ self execute: (Dictionary new
			at: #id put: aString;
			yourself)
]

{
	#category : #response,
	#'squeak_changestamp' : 'RK 6/16/2024 14:06'
}
SPOCApiAlbum >> tinkerReponseContent: aContentStream [
	
	| content tracks index|
	content := Json readFrom: aContentStream readStream.
	tracks := OrderedCollection new.
	index := 0.
	(content at: #items) do: [:anItem |
		| track |
		track := (self tinkerTrack: anItem) offset: index.
		index := index + 1.
		tracks add: track].
	^ tracks
]
