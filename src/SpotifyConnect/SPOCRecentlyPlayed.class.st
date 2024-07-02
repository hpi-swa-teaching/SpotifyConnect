Class {
	#name : #SPOCRecentlyPlayed,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'tracks',
		'trackItems'
	],
	#category : #'SpotifyConnect-UI'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 6/1/2024 22:10'
}
SPOCRecentlyPlayed class >> afterTimestamp [

	^ 1484811043508
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 6/9/2024 13:53'
}
SPOCRecentlyPlayed class >> beforeTimestamp [

	^ DateAndTime current asUnixTime * 1000
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 6/19/2024 16:32'
}
SPOCRecentlyPlayed class >> recentlyPlayedIconPath [

	^ '/assets/recently-played.png'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 6/1/2024 22:08'
}
SPOCRecentlyPlayed class >> trackLimit [

	^10
]

{
	#category : #building,
	#'squeak_changestamp' : 'VK 6/19/2024 16:33'
}
SPOCRecentlyPlayed >> buildButton [

	| text button |
	text := SPOCBoxedTextWithIcon newWithText: ' Recently Played' withIcon: self class recentlyPlayedIconPath.
	button := Morph new color: Color transparent;
		addMorph: text;
		yourself.
	button extent: 0@0;
		extent: button fullBounds extent.
	self addMorph: (SPOCClickable newUsing: button onClick: [:anEvent | self getRecentlyPlayed])
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'VE 7/2/2024 18:56'
}
SPOCRecentlyPlayed >> getRecentlyPlayed [

	| apiEndpoint |
	self isDisabled ifTrue: [self showPopUp. ^ self].
	apiEndpoint := SPOCApiRecentlyPlayed new
		authorizer: self app auth;
		yourself.
	self results: (apiEndpoint getRecentlyPlayed).
	self app resultList updateResults: self results;
		title: 'Recently Played'
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 6/15/2024 16:41'
}
SPOCRecentlyPlayed >> initialize [

	super initialize.
	
	self 
		color: Color transparent;
		items: OrderedCollection new;
		results: OrderedCollection new;
		buildButton;
		extendFully;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/15/2024 16:41'
}
SPOCRecentlyPlayed >> items [
	^ trackItems
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/15/2024 16:41'
}
SPOCRecentlyPlayed >> items: anObject [
	trackItems := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/15/2024 16:41'
}
SPOCRecentlyPlayed >> results [
	^ tracks
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/15/2024 16:41'
}
SPOCRecentlyPlayed >> results: anObject [
	tracks := anObject
]
