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
	#'squeak_changestamp' : 'VE 6/10/2024 21:59'
}
SPOCCurrentlyPlaying >> attachItem [
		
	self item: ((SPOCResultListItem newWith: self track) hasTertiaryText: false; 
			yourself);
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
