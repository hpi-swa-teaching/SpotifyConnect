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
	#'squeak_changestamp' : 'MH 5/27/2024 01:11'
}
SPOCVolume >> changeVolumeTo: aVolume on: aDevice [

	|dict apiEndpoint res|
	dict:= Dictionary new.
	dict at: #volume_percent put: aVolume.
	dict at: #device_id put: aDevice.
	apiEndpoint := SPOCApiVolume new.apiEndpoint authorizer: auth.
	res := apiEndpoint execute: dict.
	Transcript showln: res.

]
