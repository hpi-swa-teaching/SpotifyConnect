Class {
	#name : #SPOCPlayer,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'button',
		'deviceID',
		'isPlaying',
		'nextIcon',
		'playPauseIcon',
		'previousIcon'
	],
	#category : #SpotifyConnect
}

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 6/3/2024 22:53'
}
SPOCPlayer class >> nextIconPath [

	^ '/assets/next.png'
]

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
	#'squeak_changestamp' : 'TL 6/3/2024 22:54'
}
SPOCPlayer class >> previousIconPath [

	^ '/assets/previous.png'
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/3/2024 23:35'
}
SPOCPlayer >> attachNextButton [
	
	self nextIcon: (SPOCIcon new iconAsset: SPOCPlayer nextIconPath; yourself);
		button: (SPOCClickable newUsing: self nextIcon onClick: [:anEvent | self skipToNext]);
		addMorph: self button
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/3/2024 23:35'
}
SPOCPlayer >> attachPlayPauseButton [
	
	self playPauseIcon: (SPOCIcon new iconAsset: SPOCPlayer playIconPath; yourself);
		button: (SPOCClickable newUsing: self playPauseIcon onClick: [:anEvent | self switchPlaybackState]);
		addMorph: self button;
		updatePlayPauseIcon
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/3/2024 23:35'
}
SPOCPlayer >> attachPreviousButton [
	
	self previousIcon: (SPOCIcon new iconAsset: SPOCPlayer previousIconPath; yourself);
		button: (SPOCClickable newUsing: self previousIcon onClick: [:anEvent | self skipToPrevious]);
		addMorph: self button
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/3/2024 23:35'
}
SPOCPlayer >> button [

	^ button
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/3/2024 23:35'
}
SPOCPlayer >> button: anObject [

	button := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/3/2024 23:37'
}
SPOCPlayer >> deviceID [

	^ deviceID
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/3/2024 23:37'
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
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/3/2024 23:18'
}
SPOCPlayer >> initialize [

	super initialize.
	
	self color: Color transparent;
		isPlaying: false;
		attachNextButton;
		attachPlayPauseButton;
		attachPreviousButton;
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		cellInset: 10;
		extendFully
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 6/3/2024 14:01'
}
SPOCPlayer >> isPlaying [

	 ^ isPlaying
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/3/2024 16:08'
}
SPOCPlayer >> isPlaying: anObject [

	isPlaying := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/3/2024 23:37'
}
SPOCPlayer >> nextIcon [

	^ nextIcon
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/3/2024 23:37'
}
SPOCPlayer >> nextIcon: anObject [

	nextIcon := anObject
]

{
	#category : #'api-connection',
	#'squeak_changestamp' : 'TL 6/3/2024 23:28'
}
SPOCPlayer >> pause [

	| apiEndpoint paramDict |
	paramDict := Dictionary new.
	paramDict at: #device_id put: self deviceID.
	apiEndpoint := SPOCApiPause new.
	apiEndpoint authorizer: self app auth;
		execute: paramDict
]

{
	#category : #'api-connection',
	#'squeak_changestamp' : 'TL 6/3/2024 23:28'
}
SPOCPlayer >> play [

	| apiEndpoint paramDict |
	paramDict := Dictionary new.
	paramDict at: #device_id put: self deviceID.
	apiEndpoint := SPOCApiPlay new.
	apiEndpoint authorizer: self app auth;
		execute: paramDict
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/3/2024 23:37'
}
SPOCPlayer >> playPauseIcon [

	^ playPauseIcon
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/3/2024 23:37'
}
SPOCPlayer >> playPauseIcon: anObject [

	playPauseIcon := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/3/2024 23:37'
}
SPOCPlayer >> previousIcon [

	^ previousIcon
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/3/2024 23:37'
}
SPOCPlayer >> previousIcon: anObject [

	previousIcon := anObject
]

{
	#category : #'api-connection',
	#'squeak_changestamp' : 'TL 6/3/2024 23:28'
}
SPOCPlayer >> skipToNext [

	| apiEndpoint paramDict |
	paramDict := Dictionary new.
	paramDict at: #device_id put: self deviceID.
	apiEndpoint := SPOCApiNext new.
	apiEndpoint authorizer: self app auth;
		execute: paramDict
]

{
	#category : #'api-connection',
	#'squeak_changestamp' : 'TL 6/3/2024 23:12'
}
SPOCPlayer >> skipToPrevious [

	| apiEndpoint paramDict |
	paramDict := Dictionary new.
	paramDict at: #device_id put: self deviceID.
	apiEndpoint := SPOCApiPrevious new.
	apiEndpoint authorizer: self app auth;
		execute: paramDict
]

{
	#category : #actions,
	#'squeak_changestamp' : 'TL 6/3/2024 23:36'
}
SPOCPlayer >> switchPlaybackState [

	self updateIsPlaying.
	self isPlaying 
		ifTrue: [self pause.
			self playPauseIcon iconAsset: SPOCPlayer playIconPath]
		ifFalse: [self play.
			self playPauseIcon iconAsset: SPOCPlayer pauseIconPath]
		
		
]

{
	#category : #'api-connection',
	#'squeak_changestamp' : 'TL 6/3/2024 23:28'
}
SPOCPlayer >> updateIsPlaying [

	| apiEndpoint paramDict response |
	paramDict := Dictionary new.
	paramDict at: #additional_types put: 'track'.
	apiEndpoint := SPOCApiPlaybackState new.
	apiEndpoint authorizer: self app auth.
	response := apiEndpoint execute: paramDict.
	self deviceID: ((response at: 'device') at: 'id').
	self isPlaying: (response at: 'is_playing')
]

{
	#category : #actions,
	#'squeak_changestamp' : 'TL 6/3/2024 23:36'
}
SPOCPlayer >> updatePlayPauseIcon [

	self isPlaying
		ifTrue: [self playPauseIcon iconAsset: SPOCPlayer pauseIconPath]
		ifFalse: [self playPauseIcon iconAsset: SPOCPlayer playIconPath]
]
