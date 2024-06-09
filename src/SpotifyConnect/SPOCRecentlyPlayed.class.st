Class {
	#name : #SPOCRecentlyPlayed,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'tracks',
		'trackMorphs'
	],
	#category : #SpotifyConnect
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
	#'squeak_changestamp' : 'VK 6/1/2024 22:08'
}
SPOCRecentlyPlayed class >> trackLimit [

	^10
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 6/9/2024 14:44'
}
SPOCRecentlyPlayed >> buildButton [

	| text icon button |
	text := (SPOCBoxedText new contents: ' Recently Played';
		position: SPOCStyle recentlyPlayedPadding@0;
		yourself).
	icon := SPOCIcon new iconAsset: '/assets/recently-played.png'.
	button := Morph new color: Color transparent.
	button addMorph: text;
		addMorph: icon;
		yourself.
	self addMorph: (SPOCClickable newUsing: button onClick: [:anEvent | self getRecentlyPlayed])
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 6/9/2024 13:15'
}
SPOCRecentlyPlayed >> getRecentlyPlayed [

	| dict apiEndpoint |
	dict := Dictionary new.
	dict at: 'limit' put: SPOCRecentlyPlayed trackLimit;
		at: 'after' put: SPOCRecentlyPlayed afterTimestamp;
		yourself.
	apiEndpoint := SPOCApiRecentlyPlayed new.
	apiEndpoint authorizer: self app auth.
	self tracks: (apiEndpoint execute: dict).
	self app resultList updateResults: tracks.
	self app resultList title: 'Recently Played'.
	self app currentlyPlaying update
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 6/9/2024 13:53'
}
SPOCRecentlyPlayed >> initialize [

	super initialize.
	
	self 
		color: Color transparent;
		trackMorphs: OrderedCollection new;
		tracks: OrderedCollection new;
		buildButton;
		extendFully;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/1/2024 20:16'
}
SPOCRecentlyPlayed >> trackMorphs [
	^ trackMorphs
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/1/2024 20:16'
}
SPOCRecentlyPlayed >> trackMorphs: anObject [
	trackMorphs := anObject
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
