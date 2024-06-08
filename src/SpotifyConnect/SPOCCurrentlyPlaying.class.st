Class {
	#name : #SPOCCurrentlyPlaying,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'track',
		'item'
	],
	#category : #SpotifyConnect
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 6/8/2024 22:16'
}
SPOCCurrentlyPlaying >> initialize [

	super initialize.
	self track: SPOCApp testTrack;
		item: (SPOCResultListItem newWith: self track);
		addMorph: item;
		yourself.
	self item hasTertiaryText: false.
	self item resizeTo: SPOCStyle currentlyPlayingWidth@SPOCStyle resultListItemHeight
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/8/2024 22:02'
}
SPOCCurrentlyPlaying >> item [
	^ item
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/8/2024 22:18'
}
SPOCCurrentlyPlaying >> item: aSPOCResultListItem [
	item := aSPOCResultListItem
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/8/2024 22:02'
}
SPOCCurrentlyPlaying >> track [
	^ track
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/8/2024 22:02'
}
SPOCCurrentlyPlaying >> track: anObject [
	track := anObject
]
