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
	#'squeak_changestamp' : 'TL 6/18/2024 23:35'
}
SPOCPlayer >> attachNextButton [

	self nextIcon: (SPOCIcon new
				iconAsset: self class nextIconPath;
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
	#'squeak_changestamp' : 'TL 6/18/2024 23:35'
}
SPOCPlayer >> attachPlayPauseButton [

	self playPauseIcon: (SPOCIcon new
				iconAsset: self class playIconPath;
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
	#'squeak_changestamp' : 'TL 6/18/2024 23:36'
}
SPOCPlayer >> attachPreviousButton [

	self previousIcon: (SPOCIcon new 
				iconAsset: self class previousIconPath;
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
	#'squeak_changestamp' : 'TL 6/17/2024 16:51'
}
SPOCPlayer >> executeButtonFunction: anIcon [
	
	self app updatePlaybackState.
	self disabled
		ifFalse: [(anIcon == self previousIcon)
				ifTrue: [self skipToPrevious].
			(anIcon == self playPauseIcon)
				ifTrue: [self switchPlaybackState].
			(anIcon == self nextIcon)
				ifTrue: [self skipToNext].
			self app updatePlaybackState]

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
	#'squeak_changestamp' : 'TL 6/17/2024 12:20'
}
SPOCPlayer >> pause [

	SPOCApiPause new
		authorizer: self app auth;
		pauseOn: self deviceID;
		yourself
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/17/2024 12:15'
}
SPOCPlayer >> play [

	SPOCApiPlay new
		authorizer: self app auth;
		playOn: self deviceID;
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
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/17/2024 16:47'
}
SPOCPlayer >> playTrack: aString [

	SPOCApiPlay new
		authorizer: self app auth;
		playTrack: aString on: self deviceID;
		yourself.
	self app updatePlaybackState

]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/17/2024 16:50'
}
SPOCPlayer >> playTrack: aString withContext: anotherString [

	SPOCApiPlay new
		authorizer: self app auth;
		playTrack: aString withContext: anotherString on: self deviceID
		yourself.
	self app updatePlaybackState

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
	#'squeak_changestamp' : 'TL 6/17/2024 16:50'
}
SPOCPlayer >> skipToNext [

	SPOCApiNext new
		authorizer: self app auth;
		skipToNextOn: self deviceID;
		yourself.
	self app updatePlaybackState
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/17/2024 16:50'
}
SPOCPlayer >> skipToPrevious [

	SPOCApiPrevious new
		authorizer: self app auth;
		skipToPreviousOn: self deviceID;
		yourself.
	self app updatePlaybackState
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
	#'squeak_changestamp' : 'TL 6/18/2024 23:56'
}
SPOCPlayer >> updatePlayPauseIcon [

	self isPlaying
		ifTrue: [self playPauseIcon iconAsset: self class pauseIconPath]
		ifFalse: [self playPauseIcon iconAsset: self class playIconPath]
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
