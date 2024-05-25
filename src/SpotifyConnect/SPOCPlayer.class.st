Class {
	#name : #SPOCPlayer,
	#superclass : #Object,
	#category : #SpotifyConnect
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/25/2024 15:37'
}
SPOCPlayer >> isPlaying [

	| apiEndpoint dict res |
	dict := Dictionary new.
	dict at: #additional_types put: 'track'.
	apiEndpoint := SPOCApiPlayer new.
	apiEndpoint authorizer: SPOCApiPlayer getAccessToken.
	res := apiEndpoint execute: dict.
	Transcript showln: res.
]
