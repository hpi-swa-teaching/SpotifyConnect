Class {
	#name : #SPOCTestApiPlaybackState,
	#superclass : #SPOCTestApiEndpoint,
	#instVars : [
		'requestParts'
	],
	#category : #'SpotifyConnect-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TL 6/2/2024 21:50'
}
SPOCTestApiPlaybackState >> setUp [

	apiEndpoint := SPOCApiPlaybackState new.
	requestParts := {'device'. 'repeat_state'. 'shuffle_state'. 'context'. 'timestamp'. 'progress_ms'. 'is_playing'. 'item'. 'currently_playing_type'. 'actions'}.
	apiEndpoint returnsTestContent: true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TL 6/2/2024 19:53'
}
SPOCTestApiPlaybackState >> testExecute [

	| paramDict response |
    	paramDict := Dictionary new.
    	paramDict at: #additional_types put: 'track'.
    	response := apiEndpoint execute: paramDict.
	self assert: (requestParts allSatisfy: [:each | response includesSubstring: each])
]
