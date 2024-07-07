"
concrete API endpoint for the current playback state
"
Class {
	#name : #SPOCApiPlaybackState,
	#superclass : #SPOCApiEndpoint,
	#category : #'SpotifyConnect-API',
	#'squeak_changestamp' : 'OW 7/4/2024 11:59'
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
	#category : #response,
	#'squeak_changestamp' : 'OW 7/7/2024 16:51'
}
SPOCApiPlaybackState >> executeTest [

	^ self loadMockdataFromAsset: 'playbackStateResponse'
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 7/7/2024 03:15'
}
SPOCApiPlaybackState >> getPlaybackState [

	^ self execute: (Dictionary new at: #additional_types put: 'track'; yourself)
]

{
	#category : #response,
	#'squeak_changestamp' : 'TL 6/10/2024 23:46'
}
SPOCApiPlaybackState >> tinkerReponseContent: aContentStream [
	
	| content |
	content := Json readFrom: aContentStream readStream.
	^ self tinkerPlaybackState: content
]
