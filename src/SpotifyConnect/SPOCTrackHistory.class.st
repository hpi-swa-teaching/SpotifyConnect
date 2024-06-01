Class {
	#name : #SPOCTrackHistory,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'text',
		'button',
		'panel',
		'tracks'
	],
	#category : #SpotifyConnect
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'VK 6/1/2024 14:01'
}
SPOCTrackHistory >> attachButton [

	self text: (SPOCBoxedText new contents: 'Song History'; yourself);
		button: ( SPOCClickable newUsing: self text onClick: [:enEvent | self getTrackHistory]);
		addMorph: self button.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 6/1/2024 13:46'
}
SPOCTrackHistory >> buildTrackMorphFrom: aTrack [

	| background image trackText artistText finishedMorph |
	background := RectangleMorph new
		color: SPOCStyle spotifyGray;
		extent: (600@2*50);
		morphicLayerNumber: 300.
	image := (aTrack album) image.
	image position: (background position + (50 * 0.25@(50 * 0.25)));
		morphicLayerNumber: 300 - 1.
	trackText := SPOCText newAt: (image topRight + ((50 * 0.25)@0)) withText: aTrack name.
	artistText := SPOCText newAt: (image bottomRight +  ((50 * 0.25)@(self height negated * 0.5))) withText: (aTrack album artistsAsString).
	finishedMorph := Morph new
		addMorph: background;
		addMorph: image;
		addMorph: trackText;
		addMorph: artistText;
		vResizing: #shrinkWrap.
	 ^ SPOCClickable newUsing: finishedMorph onClick: [:anEvent | nil] "TODO: embed the play track method" 
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/1/2024 13:08'
}
SPOCTrackHistory >> button [
	^ button
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/1/2024 13:08'
}
SPOCTrackHistory >> button: anObject [
	button := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VK 6/1/2024 13:59'
}
SPOCTrackHistory >> createPanel: anOrderedCollection [

	self panel items: anOrderedCollection.
	self panel buildItemMorphsWith: [ :value | self buildTrackMorphFrom: value].
	self panel buildPanelAtPos: self bottomLeft withExtent: (600)@(500).
	self addMorph: self panel
	"TODO general values not magic Numbers"
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VK 6/1/2024 14:00'
}
SPOCTrackHistory >> getTrackHistory [

	| dict apiEndpoint |
	dict := Dictionary new.
	apiEndpoint := SPOCApiTrackHistory new.
	apiEndpoint authorizer: self auth.
	self tracks: (apiEndpoint execute: dict).
	self createPanel: self tracks.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VK 6/1/2024 13:49'
}
SPOCTrackHistory >> initialize [

	super initialize.
	
	self self color: Color transparent;
		panel: SPOCList new;
		attachButton;
		extendFully.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/1/2024 13:09'
}
SPOCTrackHistory >> panel [
	^ panel
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/1/2024 13:09'
}
SPOCTrackHistory >> panel: anObject [
	panel := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/1/2024 13:08'
}
SPOCTrackHistory >> text [
	^ text
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/1/2024 13:08'
}
SPOCTrackHistory >> text: anObject [
	text := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/1/2024 13:08'
}
SPOCTrackHistory >> tracks [
	^ tracks
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/1/2024 13:08'
}
SPOCTrackHistory >> tracks: anObject [
	tracks := anObject
]
