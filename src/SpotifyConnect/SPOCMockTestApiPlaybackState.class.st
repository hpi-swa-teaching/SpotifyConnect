Class {
	#name : #SPOCMockTestApiPlaybackState,
	#superclass : #TestCase,
	#instVars : [
		'requestParts',
		'apiEndpoint'
	],
	#category : #'SpotifyConnect-Mock-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/5/2024 19:37'
}
SPOCMockTestApiPlaybackState >> setUp [

	apiEndpoint := SPOCApiPlaybackState new.
	requestParts := {'device'. 'repeat_state'. 'shuffle_state'. 'context'. 'timestamp'. 'progress_ms'. 'is_playing'. 'item'. 'currently_playing_type'. 'actions'}.
	apiEndpoint returnsTestContent: true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/5/2024 19:43'
}
SPOCMockTestApiPlaybackState >> testMockApiPlaybackExecute [

	| paramDict response |
    	paramDict := Dictionary new.
    	paramDict at: #additional_types put: 'track'.
    	response := apiEndpoint execute: paramDict.
	self assert: (requestParts allSatisfy: [:each | response includesSubstring: each])
]
