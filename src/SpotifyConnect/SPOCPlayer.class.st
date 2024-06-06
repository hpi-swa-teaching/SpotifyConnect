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
	#'squeak_changestamp' : 'TL 6/4/2024 11:52'
}
SPOCPlayer >> attachNextButton [

	self nextIcon: (SPOCIcon new
				iconAsset: SPOCPlayer nextIconPath;
			 	yourself);		
		button: (SPOCClickable
				newUsing: self nextIcon
				onClick: [:anEvent | self skipToNext]);
		 addMorph: self button
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/4/2024 11:51'
}
SPOCPlayer >> attachPlayPauseButton [

	self playPauseIcon: (SPOCIcon new
				iconAsset: SPOCPlayer playIconPath;
			 	yourself);		
		button: (SPOCClickable
				newUsing: self playPauseIcon
				onClick: [:anEvent | self switchPlaybackState]);
		 addMorph: self button;
		 updatePlayPauseIcon
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/4/2024 11:51'
}
SPOCPlayer >> attachPreviousButton [

	self previousIcon: (SPOCIcon new 
				iconAsset: SPOCPlayer previousIconPath;
			 	yourself);		
		button: (SPOCClickable
				newUsing: self previousIcon
				onClick: [:anEvent | self skipToPrevious]);
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
	#'squeak_changestamp' : 'MH 6/5/2024 14:32'
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
	#'squeak_changestamp' : 'TL 6/4/2024 11:46'
}
SPOCPlayer >> pause [

	| paramDict |
	paramDict := Dictionary new
		at: #device_id put: self deviceID;
		yourself.
	SPOCApiPause new authorizer: self app auth;
		execute: paramDict;
		yourself
]

{
	#category : #'api-connection',
	#'squeak_changestamp' : 'TL 6/4/2024 11:46'
}
SPOCPlayer >> play [

	| paramDict |
	paramDict := Dictionary new
		at: #device_id put: self deviceID;
		yourself.
	SPOCApiPlay new
		authorizer: self app auth;
		execute: paramDict;
		yourself
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'MH 6/5/2024 14:31'
}
SPOCPlayer >> playSong: aString [

	| paramDict apiEndpoint response|
	paramDict := Dictionary new.
	paramDict at: #device_id put: self deviceID.
	paramDict at: #uris put: '"spotify:track:', aString,'"'.
	apiEndpoint := SPOCApiPlay new.
	apiEndpoint authorizer: app auth.
	response := apiEndpoint execute: paramDict.
	self playPauseIcon iconAsset: SPOCPlayer pauseIconPath

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
	#'squeak_changestamp' : 'TL 6/4/2024 11:46'
}
SPOCPlayer >> skipToNext [

	| paramDict |
	paramDict := Dictionary new
		at: #device_id put: self deviceID;
		yourself.
	SPOCApiNext new
		authorizer: self app auth;
		execute: paramDict;
		yourself
]

{
	#category : #'api-connection',
	#'squeak_changestamp' : 'TL 6/4/2024 11:46'
}
SPOCPlayer >> skipToPrevious [

	| paramDict |
	paramDict := Dictionary new
		at: #device_id put: self deviceID;
		yourself.
	SPOCApiPrevious new
		authorizer: self app auth;
		execute: paramDict;
		yourself
]

{
	#category : #actions,
	#'squeak_changestamp' : 'MH 6/4/2024 15:10'
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
	#'squeak_changestamp' : 'TL 6/4/2024 11:48'
}
SPOCPlayer >> updateIsPlaying [

	| apiEndpoint paramDict res |
	paramDict := Dictionary new
		at: #additional_types put: 'track';
		yourself.
	apiEndpoint := SPOCApiPlaybackState new
		authorizer: self app auth;
		yourself.
	res := apiEndpoint execute: paramDict.
	self deviceID: ((res at: 'device') at: 'id').
	self isPlaying: (res at: 'is_playing')
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
