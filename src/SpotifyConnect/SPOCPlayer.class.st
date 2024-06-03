Class {
	#name : #SPOCPlayer,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'button',
		'deviceID',
		'icon',
		'isPlaying'
	],
	#category : #SpotifyConnect
}

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 5/30/2024 12:02'
}
SPOCPlayer class >> pauseIconPath [

	^ '/assets/pause.png'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 5/30/2024 12:02'
}
SPOCPlayer class >> playIconPath [

	^ '/assets/play.png'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 5/30/2024 12:02'
}
SPOCPlayer class >> skipNextIconPath [

	^ '/assets/next.png'
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 6/3/2024 14:08'
}
SPOCPlayer >> attachPlayPauseButton [
	
	self icon: (SPOCIcon new iconAsset: SPOCPlayer playIconPath; yourself);
		button: (SPOCClickable newUsing: icon onClick: [:enEvent | self switchPlaybackState]);
		addMorph: self button;
		updatePlayPauseIcon.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 5/30/2024 12:09'
}
SPOCPlayer >> attachSkipNextButton [
	
	self icon: (SPOCIcon new iconAsset: SPOCPlayer skipNextIconPath; yourself);
		button: (SPOCClickable newUsing: icon onClick: [:enEvent | self skipToNext]);
		addMorph: self button
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 5/30/2024 12:03'
}
SPOCPlayer >> button [
	^ button
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 5/30/2024 12:03'
}
SPOCPlayer >> button: anObject [
	button := anObject
]

{
	#category : #'dev-examples',
	#'squeak_changestamp' : 'TL 5/29/2024 19:55'
}
SPOCPlayer >> currentDevice [

	^ 'b704b454bce64526992a3f207723032f5f91e635'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 5/30/2024 12:16'
}
SPOCPlayer >> deviceID [
	^ deviceID
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 5/30/2024 12:16'
}
SPOCPlayer >> deviceID: anObject [
	deviceID := anObject
]

{
	#category : #actions,
	#'squeak_changestamp' : 'TL 5/30/2024 11:54'
}
SPOCPlayer >> enableButtons [

	"enable buttons only if user is logged in"
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 5/30/2024 12:00'
}
SPOCPlayer >> icon [
	^ icon
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 5/30/2024 12:00'
}
SPOCPlayer >> icon: anObject [
	icon := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 6/3/2024 14:18'
}
SPOCPlayer >> initialize [

	super initialize.
	
	self color: Color transparent;
		isPlaying: false;
		attachPlayPauseButton;
		attachSkipNextButton;
		layoutPolicy: TableLayout new;
		extendFully
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/3/2024 14:01'
}
SPOCPlayer >> isPlaying [

	 ^ isPlaying
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 6/3/2024 14:01'
}
SPOCPlayer >> isPlaying: anObject [
	isPlaying := anObject
]

{
	#category : #'api-connection',
	#'squeak_changestamp' : 'TL 5/30/2024 12:16'
}
SPOCPlayer >> pause [

	| paramDict response apiEndpoint |
	paramDict := Dictionary new.
	paramDict at: #device_id put: self deviceID.
	apiEndpoint := SPOCApiPause new.
	apiEndpoint authorizer: app auth.
	response := apiEndpoint execute: paramDict
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/3/2024 14:31'
}
SPOCPlayer >> play [

	| paramDict apiEndpoint response |
	paramDict := Dictionary new.
	paramDict at: #device_id put: self deviceID.
	Transcript showln: self deviceID.
	apiEndpoint := SPOCApiPlay new.
	apiEndpoint authorizer: app auth.
	response := apiEndpoint execute: paramDict.
	response explore.
]

{
	#category : #'api-connection',
	#'squeak_changestamp' : 'TL 5/30/2024 12:16'
}
SPOCPlayer >> skipToNext [

	| paramDict apiEndpoint response |
	paramDict := Dictionary new.
	paramDict 	at: #device_id put: self deviceID.
	apiEndpoint := SPOCApiNext new.
	apiEndpoint authorizer: app auth.
	response := apiEndpoint execute: paramDict
]

{
	#category : #actions,
	#'squeak_changestamp' : 'MH 5/27/2024 14:49'
}
SPOCPlayer >> switchPlaybackState [

	self isPlaying 
		ifTrue: [self pause]
		ifFalse: [self play]
		
		
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/3/2024 14:32'
}
SPOCPlayer >> updateIsPlaying [

	| apiEndpoint paramDict response |
	paramDict := Dictionary new.
	paramDict at: #additional_types put: 'track'.
	apiEndpoint := SPOCApiPlaybackState new.
	apiEndpoint authorizer: self app auth.
	response := apiEndpoint execute: paramDict.
	self deviceID: ((response at: #device) at: #id).
	self isPlaying: (response at: 'is_playing')
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/3/2024 14:07'
}
SPOCPlayer >> updatePlayPauseIcon [

	self isPlaying
		ifTrue: [self icon iconAsset: SPOCPlayer pauseIconPath]
		ifFalse: [self icon iconAsset: SPOCPlayer playIconPath].
]
