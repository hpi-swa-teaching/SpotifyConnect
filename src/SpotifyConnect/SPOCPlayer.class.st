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
	#'squeak_changestamp' : 'TL 6/8/2024 19:20'
}
SPOCPlayer >> attachButton: anIcon [

	self button: (SPOCClickable
				newUsing: anIcon
				onClick: [:anEvent | self executeButtonFunction: anIcon]);
		 addMorph: self button
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/4/2024 13:35'
}
SPOCPlayer >> attachNextButton [

	self nextIcon: (SPOCIcon new
				iconAsset: SPOCPlayer nextIconPath;
			 	yourself);		
		attachButton: self nextIcon
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/4/2024 13:34'
}
SPOCPlayer >> attachPlayPauseButton [

	self playPauseIcon: (SPOCIcon new
				iconAsset: SPOCPlayer playIconPath;
			 	yourself);		
		attachButton: self playPauseIcon;
		updatePlayPauseIcon
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/4/2024 13:34'
}
SPOCPlayer >> attachPreviousButton [

	self previousIcon: (SPOCIcon new 
				iconAsset: SPOCPlayer previousIconPath;
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
	#'squeak_changestamp' : 'TL 6/10/2024 01:07'
}
SPOCPlayer >> executeButtonFunction: anIcon [
	
	self app auth accessToken
		ifNil: [UIManager inform: 'Please log in!']
		ifNotNil: [self updateIsPlaying.
			(anIcon == self previousIcon)
				ifTrue: [self skipToPrevious].
			(anIcon == self playPauseIcon)
				ifTrue: [self switchPlaybackState].
			(anIcon == self nextIcon)
				ifTrue: [self skipToNext].
			self updateIsPlaying]
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
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/10/2024 04:37'
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
	#'squeak_changestamp' : 'TL 6/10/2024 04:37'
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
	#'squeak_changestamp' : 'TL 6/10/2024 14:27'
}
SPOCPlayer >> playSong: aString [

	| paramDict |
	paramDict := Dictionary new
		at: #device_id put: self deviceID;
		at: #uris put: '"spotify:track:', aString, '"';
		yourself.
	SPOCApiPlay new
		authorizer: self app auth;
		execute: paramDict;
		yourself.
	self updateIsPlaying

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
	#'squeak_changestamp' : 'TL 6/10/2024 04:37'
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
	#'squeak_changestamp' : 'TL 6/10/2024 04:37'
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
	#'squeak_changestamp' : 'TL 6/10/2024 01:07'
}
SPOCPlayer >> switchPlaybackState [

	self isPlaying 
		ifTrue: [self pause]
		ifFalse: [self play]
		
		
]

{
	#category : #actions,
	#'squeak_changestamp' : 'TL 6/10/2024 05:07'
}
SPOCPlayer >> updateIsPlaying [

	| playbackState |
	playbackState := self getPlaybackState.
	playbackState class = SPOCApiEndpointResult
		ifTrue: [playbackState response code = 204 ifTrue: [UIManager inform: 'Please play music on your device!']]
		ifFalse: [self deviceID: playbackState device id;
			isPlaying: playbackState isPlaying].
	self updatePlayPauseIcon
]

{
	#category : #actions,
	#'squeak_changestamp' : 'TL 6/10/2024 05:07'
}
SPOCPlayer >> updateIsPlayingFromLogin [

	| playbackState |
	playbackState := self getPlaybackState.
	playbackState class = SPOCApiEndpointResult
		ifFalse: [self deviceID: playbackState device id;
			isPlaying: playbackState isPlaying].
	self updatePlayPauseIcon
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/3/2024 23:36'
}
SPOCPlayer >> updatePlayPauseIcon [

	self isPlaying
		ifTrue: [self playPauseIcon iconAsset: SPOCPlayer pauseIconPath]
		ifFalse: [self playPauseIcon iconAsset: SPOCPlayer playIconPath]
]
