Class {
	#name : #SPOCTrackHistory,
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
	#category : #initialization,
	#'squeak_changestamp' : 'VK 6/1/2024 20:52'
}
SPOCTrackHistory >> attachButton [

	self text: (SPOCBoxedText new contents: 'Song History'; yourself).
	self text position: self topLeft;
		button: ( SPOCClickable newUsing: text onClick: [:anEvent | self getTrackHistory]);
		addMorph: self button
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/1/2024 20:29'
}
SPOCTrackHistory >> buildDisplay [

	^ SPOCScrollablePanel new
		buildPanelAtPos: (self bottomLeft) withExtent: (600)@(500);
		hide
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VK 6/1/2024 20:38'
}
SPOCTrackHistory >> buildTrackHistory [

	self 
		display: self buildDisplay;
		addMorph: display;
		yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 6/1/2024 20:21'
}
SPOCTrackHistory >> buildTrackMorphFrom: aTrack [

	| background image trackText artistText finishedMorph clickResult |
	background := RectangleMorph new
		color: SPOCStyle spotifyGray;
		extent: (600@2*50);
		morphicLayerNumber: 300.
	image := (aTrack album) image.
	image position: (background position + (50 * 0.25@(50 * 0.25)));
		morphicLayerNumber: 300 - 1.
	trackText := SPOCText newAt: (image topRight + ((50 * 0.25)@0)) withText: aTrack name.
	artistText := SPOCText newAt: (image bottomRight +  ((50 * 0.25)@(self height negated * 0.5))) withText: (aTrack album artistsAsString).
	finishedMorph := Morph new color: Color transparent;
		addMorph: background;
		addMorph: image;
		addMorph: trackText;
		addMorph: artistText;
		vResizing: #shrinkWrap.
	clickResult := SPOCClickable newUsing: finishedMorph onClick: [:evt | self playTrack: aTrack id].
	clickResult vResizing: #shrinkWrap.
	^ clickResult
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
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/1/2024 20:14'
}
SPOCTrackHistory >> display [
	^ display
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/1/2024 20:14'
}
SPOCTrackHistory >> display: anObject [
	display := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VK 6/1/2024 20:34'
}
SPOCTrackHistory >> getTrackHistory [

	| dict apiEndpoint |
	dict := Dictionary new.
	apiEndpoint := SPOCApiTrackHistory new.
	apiEndpoint authorizer: self auth.
	self tracks: (apiEndpoint execute: dict).
	self updateDisplay: self tracks
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VK 6/1/2024 20:26'
}
SPOCTrackHistory >> hideHistory [
	self display hide
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VK 6/1/2024 20:36'
}
SPOCTrackHistory >> initialize [

	super initialize.
	
	self 
		color: Color transparent;
		trackMorphs: OrderedCollection new;
		tracks: OrderedCollection new;
		attachButton;
		buildTrackHistory;
		extendFully;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/1/2024 20:19'
}
SPOCTrackHistory >> playTrack: aString [
	"In this method, the track is to be played according to the given ID"
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
	#'squeak_changestamp' : 'VK 6/1/2024 20:16'
}
SPOCTrackHistory >> trackMorphs [
	^ trackMorphs
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/1/2024 20:16'
}
SPOCTrackHistory >> trackMorphs: anObject [
	trackMorphs := anObject
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

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/1/2024 20:33'
}
SPOCTrackHistory >> updateDisplay: anOrderedCollection [
	
	anOrderedCollection ifNil: [self hideHistory.
		^ self].
	display items: anOrderedCollection;
		buildItemMorphsWith: [:value | self buildTrackMorphFrom: value];
		updatePanel;
		show;
		yourself.
	self extendFully
]
