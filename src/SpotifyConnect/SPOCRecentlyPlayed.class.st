Class {
	#name : #SPOCRecentlyPlayed,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'text',
		'button',
		'tracks',
		'trackMorphs',
		'display'
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
	#category : #initialization,
	#'squeak_changestamp' : 'VK 6/9/2024 12:25'
}
SPOCRecentlyPlayed >> attachButton [

	self text: (SPOCBoxedText new contents: 'Recently Played'; yourself);
		button: ( SPOCClickable newUsing: text onClick: [:anEvent | self getRecentlyPlayed]);
		addMorph: self button
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/1/2024 13:08'
}
SPOCRecentlyPlayed >> button [
	^ button
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/1/2024 13:08'
}
SPOCRecentlyPlayed >> button: anObject [
	button := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/1/2024 20:14'
}
SPOCRecentlyPlayed >> display [
	^ display
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/1/2024 20:14'
}
SPOCRecentlyPlayed >> display: anObject [
	display := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VK 6/9/2024 12:31'
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
	self app resultList title: 'Your Results'.
	self app currentlyPlaying update
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VK 6/9/2024 12:29'
}
SPOCRecentlyPlayed >> initialize [

	super initialize.
	
	self 
		color: Color transparent;
		trackMorphs: OrderedCollection new;
		tracks: OrderedCollection new;
		attachButton;
		extendFully;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/1/2024 13:08'
}
SPOCRecentlyPlayed >> text [
	^ text
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/1/2024 13:08'
}
SPOCRecentlyPlayed >> text: anObject [
	text := anObject
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
