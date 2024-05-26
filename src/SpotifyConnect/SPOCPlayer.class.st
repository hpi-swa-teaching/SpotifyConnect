Class {
	#name : #SPOCPlayer,
	#superclass : #Object,
	#category : #SpotifyConnect
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/26/2024 21:32'
}
SPOCPlayer >> currentDevice [

	^ '4f5f10b92aa75f5973a9b7f888c91b18ed232ca3'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/26/2024 13:52'
}
SPOCPlayer >> isPlaying [

	| apiEndpoint dict res |
	dict := Dictionary new.
	dict at: #additional_types put: 'track'.
	apiEndpoint := SPOCApiPlayer new.
	"TODO: authorizer aus temporären Variablen raus" 
	apiEndpoint authorizer: SPOCApiPlayer getAccessToken.
	res := apiEndpoint execute: dict.
	"TODO: leere Json => noch nix gespielt, das irgendwie in Pop up machen"
	Transcript showln: res.
	^ res at: 'is_playing'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/26/2024 21:33'
}
SPOCPlayer >> pause [

	"hier noch zeug implementieren: die Anfrage für Pausieren"
	|dict3 res apiEndpoint|
	dict3 := Dictionary new.
	dict3 at: #device_id put: self currentDevice.
	apiEndpoint := SPOCApiPause new.
	apiEndpoint authorizer: auth.
	res:= apiEndpoint execute: dict3.

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/26/2024 21:33'
}
SPOCPlayer >> play [

	"Hier  noch Zeug implementieren: Anfrage für Play"
	|dict2 apiEndpoint res|
	dict2 := Dictionary new.
	dict2 at: #device_id put: self currentDevice.
	apiEndpoint := SPOCApiPlay new.
	apiEndpoint authorizer: auth.
	res:= apiEndpoint execute: dict2.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/26/2024 21:39'
}
SPOCPlayer >> skipToNext [

	|dict4 apiEndpoint res|
	dict4 := Dictionary new.
	dict4 at: #device_id put: self currentDevice.
	apiEndpoint := SPOCApiNext new.
	apiEndpoint authorizer: auth.
	res:= apiEndpoint execute: dict4.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/26/2024 13:51'
}
SPOCPlayer >> switchPlaybackState [

	"Hier check von is playing, jenachdem wird eine andere Funktion aufgerufen"
	self isPlaying 
		ifTrue: [self pause]
		ifFalse: [self play]
		
		
]
