Class {
	#name : #SPOCPlayer,
	#superclass : #Object,
	#category : #SpotifyConnect
}

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
	#'squeak_changestamp' : 'MH 5/26/2024 13:44'
}
SPOCPlayer >> pause [

	"hier noch zeug implementieren: die Anfrage für Pausieren"
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/26/2024 19:45'
}
SPOCPlayer >> play [

	"Hier  noch Zeug implementieren: Anfrage für Play"
	|dict2 apiEndpoint res| 
	dict2 := Dictionary new.
	dict2 at: #device_id put: '4f5f10b92aa75f5973a9b7f888c91b18ed232ca3'.
	apiEndpoint := SPOCApiPlay new.
	apiEndpoint authorizer: auth.
	res:= apiEndpoint execute: dict2.
	Transcript showln: res.
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
