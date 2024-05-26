Class {
	#name : #SPOCVolume,
	#superclass : #Object,
	#instVars : [
		'auth'
	],
	#category : #SpotifyConnect
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/27/2024 00:57'
}
SPOCVolume >> changeVolumeTo: aVolume [

	|dict apiEndpoint res|
	dict:= Dictionary new.
	dict at: #volume_percent put: aVolume.
	apiEndpoint := SPOCApiVolume new.apiEndpoint authorizer: auth.
	res := apiEndpoint execute: dict.
	Transcript showln: res.

]
