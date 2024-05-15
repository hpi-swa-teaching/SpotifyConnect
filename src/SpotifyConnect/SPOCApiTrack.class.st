Class {
	#name : #SPOCApiTrack,
	#superclass : #SPOCApiEndpoint,
	#category : #SpotifyConnect
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 12:14'
}
SPOCApiTrack >> endpoint [
	^ 'v1/tracks/'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 12:05'
}
SPOCApiTrack >> endpointMethod [
	^ 'GET'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 12:21'
}
SPOCApiTrack >> executeRequest: request withParams: aParameterDictionary [

	request rawUrl: (request rawUrl, (aParameterDictionary at: 'trackId')).
	^ self client sendRequest: request
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 12:15'
}
SPOCApiTrack >> tinkerReponseData: aReponse [
	^ Json readFrom: aReponse content readStream
]
