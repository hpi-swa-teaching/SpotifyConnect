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
	#'squeak_changestamp' : 'MH 5/27/2024 15:26'
}
SPOCVolume >> changeVolumeTo: aVolume on: aDevice [

	|dict apiEndpoint res app |
	dict:= Dictionary new.
	dict at: #volume_percent put: aVolume.
	dict at: #device_id put: aDevice.
	apiEndpoint := SPOCApiVolume new.
	apiEndpoint authorizer: app auth.
	res := apiEndpoint execute: dict.
	"Transcript showln: res."

]
