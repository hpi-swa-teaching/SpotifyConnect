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
	#category : #'SpotifyConnect-UI'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'VE 6/10/2024 22:40'
}
SPOCPlayer class >> nextIconPath [

	^ '/assets/next-white.png'
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
	#'squeak_changestamp' : 'VE 6/10/2024 22:40'
}
SPOCPlayer class >> playIconPath [

	^ '/assets/play.png'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'VE 6/10/2024 22:40'
}
SPOCPlayer class >> previousIconPath [

	^ '/assets/previous-white.png'
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 6/10/2024 22:27'
}
SPOCPlayer >> attachButton: anIcon [

	self button: (SPOCClickable
				newUsing: anIcon
				onClick: [:anEvent | self executeButtonFunction: anIcon]);
		 addMorph: self button
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/12/2024 03:21'
}
SPOCPlayer >> attachNextButton [

	self nextIcon: (SPOCIcon new
				iconAsset: SPOCPlayer nextIconPath;
				color: Color transparent;
			 	yourself);		
		attachButton: self nextIcon;
	      addMorph: (Morph new
			color: Color transparent;
			extent: 15 @ self button height;
			yourself)
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/12/2024 03:21'
}
SPOCPlayer >> attachPlayPauseButton [

	self playPauseIcon: (SPOCIcon new
				iconAsset: SPOCPlayer playIconPath;
			 	yourself);		
		attachButton: self playPauseIcon;
		addMorph: (Morph new
			color: Color transparent;
			extent: 15 @ self button height;
			yourself);
		updatePlayPauseIcon
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 6/10/2024 22:41'
}
SPOCPlayer >> attachPreviousButton [

	self previousIcon: (SPOCIcon new 
				iconAsset: SPOCPlayer previousIconPath;
				color: Color transparent;
			 	yourself);		
		attachButton: self previousIcon
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
	#category : #actions,
	#'squeak_changestamp' : 'TL 6/12/2024 03:05'
}
SPOCPlayer >> executeButtonFunction: anIcon [
	
	self app updatePlaybackStateFromLogin: false.
	self disabled
		ifFalse: [(anIcon == self previousIcon)
				ifTrue: [self skipToPrevious].
			(anIcon == self playPauseIcon)
				ifTrue: [self switchPlaybackState].
			(anIcon == self nextIcon)
				ifTrue: [self skipToNext].
			self app updatePlaybackStateFromLogin: false]

]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 6/10/2024 22:29'
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
		listCentering: #center;
		hResizing: #spaceFill;
		extendFully.
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
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/10/2024 19:47'
}
SPOCPlayer >> pause [

	| dict |
	dict := Dictionary new
		at: #device_id put: self deviceID;
		yourself.
	SPOCApiPause new
		authorizer: self app auth;
		execute: dict;
		yourself
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/10/2024 19:47'
}
SPOCPlayer >> play [

	| dict |
	dict := Dictionary new
		at: #device_id put: self deviceID;
		yourself.
	SPOCApiPlay new
		authorizer: self app auth;
		execute: dict;
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
	#category : #actions,
	#'squeak_changestamp' : 'TL 6/10/2024 20:24'
}
SPOCPlayer >> playTrack: aString [

	| dict |
	dict := Dictionary new
		at: #device_id put: self deviceID;
		at: #uris put: '"spotify:track:', aString, '"';
		yourself.
	SPOCApiPlay new
		authorizer: self app auth;
		execute: dict;
		yourself.
	self app updatePlaybackStateFromLogin: false

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
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/10/2024 20:28'
}
SPOCPlayer >> skipToNext [

	| dict |
	dict := Dictionary new
		at: #device_id put: self deviceID;
		yourself.
	SPOCApiNext new
		authorizer: self app auth;
		execute: dict;
		yourself
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/10/2024 19:48'
}
SPOCPlayer >> skipToPrevious [

	| dict |
	dict := Dictionary new
		at: #device_id put: self deviceID;
		yourself.
	SPOCApiPrevious new
		authorizer: self app auth;
		execute: dict;
		yourself
]

{
	#category : #actions,
	#'squeak_changestamp' : 'TL 6/12/2024 03:01'
}
SPOCPlayer >> switchPlaybackState [

	self isPlaying 
		ifTrue: [self pause]
		ifFalse: [self play]
		
		
]

{
	#category : #updating,
	#'squeak_changestamp' : 'TL 6/3/2024 23:36'
}
SPOCPlayer >> updatePlayPauseIcon [

	self isPlaying
		ifTrue: [self playPauseIcon iconAsset: SPOCPlayer pauseIconPath]
		ifFalse: [self playPauseIcon iconAsset: SPOCPlayer playIconPath]
]

{
	#category : #updating,
	#'squeak_changestamp' : 'TL 6/12/2024 03:12'
}
SPOCPlayer >> updatePlaybackState: aState [

	self disabled
		ifFalse: [self deviceID: aState device id;
			isPlaying: aState isPlaying;
			updatePlayPauseIcon]
]
