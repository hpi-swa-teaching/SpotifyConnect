"
concrete class for the currently playing panel
"
Class {
	#name : #SPOCCurrentlyPlaying,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'item',
		'track'
	],
	#category : #'SpotifyConnect-UI',
	#'squeak_changestamp' : 'OW 7/4/2024 12:10'
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 7/7/2024 13:05'
}
SPOCCurrentlyPlaying >> attachItem [
	
	self track hasTertiaryText: false.
	self item: (SPOCResultListItem newWith: self track);
		addMorph: self item
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 6/10/2024 22:01'
}
SPOCCurrentlyPlaying >> initialize [

	super initialize.
	
	self track: SPOCStyle trackWelcome;
		attachItem;
		layoutPolicy: TableLayout new;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		color: Color transparent
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
	#category : #updating,
	#'squeak_changestamp' : 'VE 7/11/2024 22:21'
}
SPOCCurrentlyPlaying >> needsActiveDevice [
	
	^ true
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
	#'squeak_changestamp' : 'VE 7/11/2024 22:20'
}
SPOCCurrentlyPlaying >> updatePlaybackState: aState [

	super updatePlaybackState: aState.
	self isDisabled ifTrue: [^ self].
	self track: aState track.
	self track hasTertiaryText: false.
	self item changeItemTo: self track
]
