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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 6/8/2024 23:00'
}
SPOCCurrentlyPlaying >> getPlayingTrack [

	| apiEndpoint dict res |
	dict := Dictionary new at: #additional_types put: 'track'.
	apiEndpoint := (SPOCApiPlaybackState new authorizer: self app auth).
	res := apiEndpoint execute: dict.
	^ res track
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 6/9/2024 00:01'
}
SPOCCurrentlyPlaying >> initialize [

	super initialize.
	self track: SPOCStyle trackWelcome;
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

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 6/9/2024 00:53'
}
SPOCCurrentlyPlaying >> updateTrack [
	self item changeItemTo: self getPlayingTrack
]
