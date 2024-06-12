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
	#'squeak_changestamp' : 'TL 6/12/2024 04:17'
}
SPOCRecentlyPlayed >> getRecentlyPlayed [

	| dict apiEndpoint |
	dict := Dictionary new
		at: #limit put: SPOCRecentlyPlayed trackLimit;
		at: #before put: SPOCRecentlyPlayed beforeTimestamp;
		yourself.
	apiEndpoint := SPOCApiRecentlyPlayed new
		authorizer: self app auth;
		yourself.
	self tracks: (apiEndpoint execute: dict).
	self app resultList updateResults: self tracks;
		title: 'Recently Played'
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VK 6/10/2024 19:49'
}
SPOCRecentlyPlayed >> initialize [

	super initialize.
	
	self 
		color: Color transparent;
		trackItems: OrderedCollection new;
		tracks: OrderedCollection new;
		buildButton;
		extendFully;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/10/2024 19:35'
}
SPOCRecentlyPlayed >> trackItems [
	^ trackItems
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/10/2024 19:35'
}
SPOCRecentlyPlayed >> trackItems: anObject [
	trackItems := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/1/2024 13:08'
}
SPOCRecentlyPlayed >> tracks [
	^ tracks
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/1/2024 13:08'
}
SPOCRecentlyPlayed >> tracks: anObject [
	tracks := anObject
]
