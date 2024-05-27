Class {
	#name : #SPOCPlayer,
	#superclass : #Morph,
	#category : #SpotifyConnect
}

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 5/27/2024 01:35'
}
SPOCPlayer class >> playPauseIconPath [

	^ '/asset/button/PlayPause.png'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 5/27/2024 12:07'
}
SPOCPlayer class >> skipNextIconPath [

	^ 'asset/button/skipNext'
]

{
	#category : #'dev-examples',
	#'squeak_changestamp' : 'MH 5/26/2024 21:32'
}
SPOCPlayer >> currentDevice [

	^ '4f5f10b92aa75f5973a9b7f888c91b18ed232ca3'
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 5/27/2024 14:40'
}
SPOCPlayer >> initialize [

	super initialize.
	
	self initializeLayout;
		initializePlayPause;
		initializeSkipNext
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 5/27/2024 11:56'
}
SPOCPlayer >> initializeLayout [

	self extent: 1000 @ 300;
		position: 100 @ 100;
		color: SPOCStyle spotifyBlack
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 5/27/2024 15:28'
}
SPOCPlayer >> initializePlayPause [

	"TODO: implement usage of SPOCButton and SPOCAssetImageMorph"
	
	| background button icon |
	
	background := Morph new
		color: SPOCStyle spotifyWhite;
		position: self position + (10 @ 10).
	
	icon := SPOCAssetImageMorph new 
		assetPath: self class playPauseIconPath;
		position: background position + (10 @ 10).
	
	background extent: icon extent + (20 @ 20).

	button := SimpleButtonMorph new
		label: '';
		color: Color transparent;
		position: background position + (10 @ 10);
		extent: icon extent;
		target: self;
		actionSelector: #switchPlaybackState.
	
	self addMorphFront: background;
		addMorphFront: icon;
		addMorphFront: button
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 5/27/2024 15:33'
}
SPOCPlayer >> initializeSkipNext [

	"TODO: implement usage of SPOCButton and SPOCAssetImageMorph"
	
	| background button |
	
	background := Morph new
		color: SPOCStyle spotifyWhite;
		position: self position + (10 @ 100).
	
	"icon := SPOCAssetImageMorph new 
		assetPath: self class skipNextIconPath;
		position: background position + (10 @ 10).
	self addMorphFront: icon."

	button := SimpleButtonMorph new
		label: 'Skip';
		color: Color transparent;
		position: background position + (10 @ 10);
		extent: 70 @ 30;
		target: self;
		actionSelector: #skipToNext.
		
	background extent: button extent + (20 @ 20).
		
	self addMorphFront: background;
		addMorphFront: button
]

{
	#category : #'api-connection',
	#'squeak_changestamp' : 'TL 5/27/2024 15:38'
}
SPOCPlayer >> isPlaying [

	| apiEndpoint paramDict res app |
	
	paramDict := Dictionary new
		at: #additional_types put: 'track'.
	apiEndpoint := SPOCApiPlayer new.
	apiEndpoint authorizer: app auth.
	res := apiEndpoint execute: paramDict.
	"TODO: leere Json => noch nix gespielt, das irgendwie in Pop up machen"
	Transcript showln: res.
	^ res at: 'is_playing'
]

{
	#category : #'api-connection',
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
	#category : #'api-connection',
	#'squeak_changestamp' : 'TL 5/27/2024 15:34'
}
SPOCPlayer >> play [

	"Hier  noch Zeug implementieren: Anfrage für Play"
	|dict2 apiEndpoint res app |
	dict2 := Dictionary new.
	dict2 at: #device_id put: self currentDevice.
	apiEndpoint := SPOCApiPlay new.
	apiEndpoint authorizer: app auth.
	res:= apiEndpoint execute: dict2.
]

{
	#category : #'api-connection',
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
	#category : #actions,
	#'squeak_changestamp' : 'MH 5/26/2024 13:51'
}
SPOCPlayer >> switchPlaybackState [

	"Hier check von is playing, jenachdem wird eine andere Funktion aufgerufen"
	self isPlaying 
		ifTrue: [self pause]
		ifFalse: [self play]
		
		
]
