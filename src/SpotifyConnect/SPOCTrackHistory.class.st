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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 6/1/2024 22:10'
}
SPOCTrackHistory class >> afterTimestamp [

	^ 1484811043508
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 6/1/2024 22:08'
}
SPOCTrackHistory class >> trackLimit [

	^10
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VK 6/1/2024 21:12'
}
SPOCTrackHistory >> attachButton [

	self text: (SPOCBoxedText new contents: 'Song History'; yourself);
		button: ( SPOCClickable newUsing: text onClick: [:anEvent | self getTrackHistory]);
		addMorph: self button
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 6/1/2024 21:23'
}
SPOCTrackHistory >> buildDisplay [

	^ SPOCScrollablePanel new
		buildPanelAtPos: (self topLeft + 100) withExtent: (600)@(500);
		hide
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VK 6/1/2024 21:49'
}
SPOCTrackHistory >> buildTrackHistory [

	| builtDisplay |
	builtDisplay := self buildDisplay.
	self 
		display: builtDisplay;
		addMorph: display;
		yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 6/3/2024 12:03'
}
SPOCTrackHistory >> buildTrackMorphFrom: aTrack [

	| background image trackText artistText finishedMorph clickResult border durationText height ratio width |
	height := SPOCSearchbar searchbarHeight.
	width := SPOCSearchbar searchbarWidth.
	border := SPOCSearchbar resultBorder.
	ratio := SPOCSearchbar searchbarToResultRatio.
	
	background := RectangleMorph new
		color: SPOCStyle spotifyGray;
		extent: (width +  height@(ratio * height));
		morphicLayerNumber: SPOCSearchbar baseLayer.
	image := (aTrack album) image scaledTo: (ratio * (height - border)).
	image position: (background topLeft + (border@border));
		morphicLayerNumber: SPOCSearchbar baseLayer - 1.
	trackText := SPOCText newAt: (image topRight + (border@0)) withText: aTrack name.
	artistText := SPOCText newAt: (image bottomRight +  (border@(SPOCText defaultHeight negated))) withText: (aTrack album artistsAsString).
	durationText := SPOCText newAt: (background bottomRight - (10 * border@(height + (SPOCText defaultHeight / 2)))) withText: aTrack durationAsFormattedTime.
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
	#'squeak_changestamp' : 'VK 6/1/2024 22:08'
}
SPOCTrackHistory >> getTrackHistory [

	| dict apiEndpoint |
	dict := Dictionary new.
	dict at: 'limit' put: SPOCTrackHistory trackLimit;
		at: 'after' put: SPOCTrackHistory afterTimestamp;
		yourself.
	apiEndpoint := SPOCApiTrackHistory new.
	apiEndpoint authorizer: self app auth.
	self tracks: (apiEndpoint execute: dict).
	self updateDisplay: tracks
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
	#'squeak_changestamp' : 'VK 6/3/2024 12:05'
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
	#'squeak_changestamp' : 'VK 6/1/2024 22:37'
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
