Class {
	#name : #SPOCApiPlaybackState,
	#superclass : #SPOCApiEndpoint,
	#category : #SpotifyConnect
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/26/2024 13:05'
}
SPOCApiPlaybackState class >> getAccessToken [

	^ 'BQBZXwtxc5yCEAznBT5QSwEklnLk04IOqnfUF1ScqWN4lPeR49qC8WUZzCNZnT_0O7suxLH69N-il5pNekHZXve1XQ6llqxxW0ktqHEy3bbNThD5WQDX86L5cCfPHJb9q-7Gs7yjvLlbvQ5LZOgYOaMFPIocfADeW6WZUgev3akszWVcqMeY22ej0G5jt-xLRudOdUYyQRAG9W5A48-ypg2VVadwiBQAW1BsyPyfvAha'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TL 5/27/2024 17:06'
}
SPOCApiPlaybackState >> endpoint [

	^ 'v1/me/player'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TL 5/27/2024 15:49'
}
SPOCApiPlaybackState >> endpointMethod [

	^ 'GET'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TL 6/3/2024 16:35'
}
SPOCApiPlaybackState >> executeRequest: request withParams: aParamDictionary [

	request rawUrl: (request rawUrl, '?additional_types=', (aParamDictionary at: 'additional_types')).
	^ self client sendRequest: request
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/22/2024 14:10'
}
SPOCApiPlaybackState >> executeTest [

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
	#'squeak_changestamp' : 'TL 6/7/2024 19:48'
}
SPOCApiPlaybackState >> tinkerReponseContent: aContentStream [
	
	"| artists artistItems album albumItem content device deviceItem playbackState track trackItem |
	content := Json readFrom: aContentStream readStream.
	deviceItem := content at: #device.
	device := SPOCDevice new
		id: (deviceItem at: #id);
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
	^ playbackState"
	^ Json readFrom: aContentStream readStream
	
]
