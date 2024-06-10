Class {
	#name : #SPOCCurrentlyPlaying,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'track',
		'item'
	],
	#category : #'SpotifyConnect-UI'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/10/2024 18:44'
}
SPOCCurrentlyPlaying >> initialize [

	super initialize.
	
	self track: SPOCStyle trackWelcome;
		item: (SPOCResultListItem newWith: self track);
		addMorph: self item;
		yourself.
	self item hasTertiaryText: false;
		resizeTo: SPOCStyle currentlyPlayingWidth @ SPOCStyle resultListItemHeight.
	self extendFully
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/9/2024 11:47'
}
SPOCCurrentlyPlaying >> item [

	^ item
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/9/2024 11:47'
}
SPOCCurrentlyPlaying >> item: aSPOCResultListItem [

	item := aSPOCResultListItem
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/9/2024 11:47'
}
SPOCCurrentlyPlaying >> track [

	^ track
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/9/2024 11:47'
}
SPOCCurrentlyPlaying >> track: aSPOCTrack [

	track := aSPOCTrack
]

{
	#category : #updating,
	#'squeak_changestamp' : 'TL 6/10/2024 18:57'
}
SPOCCurrentlyPlaying >> updatePlaybackState: aState [

	self track: aState track.
	self item changeItemTo: self track
]
