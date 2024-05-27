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
	#'squeak_changestamp' : 'MH 5/27/2024 15:03'
}
SPOCPlayer >> isPlaying [

	| apiEndpoint dict res app |
	dict := Dictionary new.
	dict at: #additional_types put: 'track'.
	apiEndpoint := SPOCApiPlaybackState new. 
	apiEndpoint authorizer: app auth.
	res := apiEndpoint execute: dict.
	^ res at: 'is_playing'stream
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/27/2024 15:04'
}
SPOCPlayer >> pause [

	|dict3 res apiEndpoint app |
	dict3 := Dictionary new.
	dict3 at: #device_id put: self currentDevice.
	apiEndpoint := SPOCApiPause new.
	apiEndpoint authorizer: app auth.
	res:= apiEndpoint execute: dict3.

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/27/2024 15:04'
}
SPOCPlayer >> play [

	|dict2 apiEndpoint res app |
	dict2 := Dictionary new.
	dict2 at: #device_id put: self currentDevice.
	apiEndpoint := SPOCApiPlay new.
	apiEndpoint authorizer: app auth.
	res:= apiEndpoint execute: dict2.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/27/2024 15:04'
}
SPOCPlayer >> skipToNext [

	|dict4 apiEndpoint res app |
	dict4 := Dictionary new.
	dict4 at: #device_id put: self currentDevice.
	apiEndpoint := SPOCApiNext new.
	apiEndpoint authorizer: app auth.
	res:= apiEndpoint execute: dict4.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 5/27/2024 14:49'
}
SPOCPlayer >> switchPlaybackState [

	self isPlaying 
		ifTrue: [self pause]
		ifFalse: [self play]
		
		
]
