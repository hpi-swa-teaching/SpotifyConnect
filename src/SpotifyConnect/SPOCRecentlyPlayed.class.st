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
	#'squeak_changestamp' : 'VK 6/1/2024 22:08'
}
SPOCRecentlyPlayed class >> trackLimit [

	^10
]

{
	#category : #building,
	#'squeak_changestamp' : 'VE 6/10/2024 22:07'
}
SPOCRecentlyPlayed >> buildButton [

	| text icon button |
	text := (SPOCBoxedText new contents: ' Recently Played';
		position: SPOCStyle recentlyPlayedPadding@0;
		yourself).
	icon := SPOCIcon new iconAsset: '/assets/recently-played.png'.
	button := Morph new color: Color transparent;
		addMorph: text;
		addMorph: icon;
		yourself.
	button extent: 0@0;
		extent: button fullBounds extent.
	self addMorph: (SPOCClickable newUsing: button onClick: [:anEvent | self getRecentlyPlayed])
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/17/2024 20:37'
}
SPOCRecentlyPlayed >> getRecentlyPlayed [

	| apiEndpoint |
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
