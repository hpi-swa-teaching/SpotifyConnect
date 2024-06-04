Class {
	#name : #SPOCPlayer,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'data'
	],
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
	#'squeak_changestamp' : 'MH 5/30/2024 11:44'
}
SPOCPlayer >> currentDevice [

	^ '89e8e4ef4f0d524cc4cb948a35c04bc50a21db8b'
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
	#'squeak_changestamp' : 'TL 5/29/2024 20:22'
}
SPOCPlayer >> initializePlayPause [

	"TODO: implement usage of SPOCButton and SPOCAssetImageMorph"
	
	| background button |	
	background := Morph new
		color: SPOCStyle spotifyWhite;
		position: self position + (10 @ 10).	
	"icon := SPOCAssetImageMorph new 
		assetPath: self class playPauseIconPath;
		position: background position + (10 @ 10)."
	button := SimpleButtonMorph new
		label: 'Play/Pause';
		color: Color transparent;
		position: background position + (10 @ 10);
		extent: 70 @ 30;
		target: self;
		actionSelector: #switchPlaybackState.
	background extent: button extent + (20 @ 20).	
	self addMorphFront: background;
		"addMorphFront: icon;"
		addMorphFront: button
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 5/27/2024 15:45'
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TL 5/29/2024 20:02'
}
SPOCPlayer >> isPlaying [

	| apiEndpoint paramDict response |
	paramDict := Dictionary new.
	paramDict at: #additional_types put: 'track'.
	apiEndpoint := SPOCApiPlaybackState new.
	apiEndpoint authorizer: app auth.
	response := apiEndpoint execute: paramDict.
	^ response at: 'is_playing'
]

{
	#category : #'api-connection',
	#'squeak_changestamp' : 'TL 5/27/2024 16:40'
}
SPOCPlayer >> pause [

	| paramDict response apiEndpoint |
	paramDict := Dictionary new.
	paramDict at: #device_id put: self currentDevice.
	apiEndpoint := SPOCApiPause new.
	apiEndpoint authorizer: app auth.
	response := apiEndpoint execute: paramDict
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 6/4/2024 14:55'
}
SPOCPlayer >> play [

	| paramDict apiEndpoint response |
	paramDict := Dictionary new.
	paramDict at: #device_id put: self currentDevice.
	apiEndpoint := SPOCApiPlay new.
	apiEndpoint authorizer: app auth.
	response := apiEndpoint execute: paramDict.

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 6/4/2024 14:55'
}
SPOCPlayer >> playSong: aString [

	| paramDict apiEndpoint response|
	paramDict := Dictionary new.
	paramDict at: #device_id put: self currentDevice.
	paramDict at: #uris put: '"spotify:track:', aString,'"'.
	apiEndpoint := SPOCApiPlay new.
	apiEndpoint authorizer: app auth.
	response := apiEndpoint execute: paramDict

]

{
	#category : #'api-connection',
	#'squeak_changestamp' : 'TL 5/27/2024 16:41'
}
SPOCPlayer >> skipToNext [

	| paramDict apiEndpoint response |
	paramDict := Dictionary new.
	paramDict 	at: #device_id put: self currentDevice.
	apiEndpoint := SPOCApiNext new.
	apiEndpoint authorizer: app auth.
	response := apiEndpoint execute: paramDict
]

{
	#category : #actions,
	#'squeak_changestamp' : 'MH 6/4/2024 14:56'
}
SPOCPlayer >> switchPlaybackState [

	self isPlaying 
		ifTrue: [self pause]
		ifFalse: [self play]
		
		
]
