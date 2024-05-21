Class {
	#name : #SPOCSearchbar,
	#superclass : #RectangleMorph,
	#instVars : [
		'inputField',
		'tracks',
		'trackMorphs'
	],
	#category : #SpotifyConnect
}

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 5/18/2024 00:03'
}
SPOCSearchbar class >> baseLayer [
	^ 30
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 5/21/2024 17:58'
}
SPOCSearchbar class >> searchbarHeight [
	^ 50
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 5/18/2024 21:33'
}
SPOCSearchbar class >> searchbarPosition [
	^ 100@100
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 5/21/2024 16:28'
}
SPOCSearchbar class >> searchbarWidth [
	^ 500
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 5/21/2024 20:33'
}
SPOCSearchbar class >> trackLimit [
	"Defines the number of search results displayed"
	^ 3
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 5/21/2024 17:43'
}
SPOCSearchbar >> buildResultMorphFrom: aTrack [
	| searchbarHeight background image trackText artistText|
	
	searchbarHeight := SPOCSearchbar searchbarHeight.
	background := RectangleMorph new
		color: SPOCStyle spotifyGray;
		extent: (SPOCSearchbar searchbarWidth@(2 * searchbarHeight));
		morphicLayerNumber: SPOCSearchbar baseLayer.
	image := (aTrack album) image.
	image position: (background position + (searchbarHeight * 0.25@(searchbarHeight * 0.25)));
		morphicLayerNumber: SPOCSearchbar baseLayer - 1.
	trackText := SPOCText newAt: (image topRight + ((searchbarHeight * 0.25)@0)) withText: aTrack name.
	artistText := SPOCText newAt: (image bottomRight +  ((searchbarHeight * 0.25)@(self height negated * 0.5))) withText: (aTrack album artistsAsString).
	^ Morph new
		addMorph: background;
		addMorph: image;
		addMorph: trackText;
		addMorph: artistText.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 5/21/2024 16:31'
}
SPOCSearchbar >> buildSearchbar [
		
	self color: SPOCStyle spotifyGray;
		extent: (SPOCSearchbar searchbarWidth@SPOCSearchbar searchbarHeight);
		position: SPOCSearchbar searchbarPosition;
		morphicLayerNumber: SPOCSearchbar baseLayer;
		inputField: (SPOCTextInput newAt: (SPOCSearchbar searchbarPosition + (10@10)) withText: 'Was möchtest du wiedergeben?');
		addMorph: self inputField;
		openInWorld;
		yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 5/21/2024 21:59'
}
SPOCSearchbar >> displayResults: anOrderedCollection [
	| builder spec panel |
	
	self trackMorphs isEmpty ifFalse: [self trackMorphs removeAll].
	anOrderedCollection do: [ :track |
		self trackMorphs add: (self buildResultMorphFrom: track)].
	"self trackMorphs do: [ :trackMorph |
		trackMorph on: #mouseDown send: #chosen to: [trackMorph playTrack]]."
	
	builder := ToolBuilder default.
	spec := builder pluggableScrollPaneSpec new
		vScrollBarPolicy: #whenNeeded;
		yourself.
	panel := builder build: spec.
	panel scroller
		layoutPolicy: TableLayout new;
		addAllMorphs: trackMorphs.
	panel
		position: self bottomLeft;
		openInWorld
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 5/21/2024 20:02'
}
SPOCSearchbar >> initialize [
	super initialize.
	
	self
		trackMorphs: OrderedCollection new;
		tracks: OrderedCollection new;
		buildSearchbar;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/17/2024 11:15'
}
SPOCSearchbar >> inputField [
	^ inputField
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/18/2024 00:51'
}
SPOCSearchbar >> inputField: aSPOCTextInput [
	inputField := aSPOCTextInput
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 5/18/2024 20:44'
}
SPOCSearchbar >> sanitizeInput: aString [
	
	| santitizedInput |
	santitizedInput := aString copyReplaceAll: ' ' with: '+'.
	^ santitizedInput
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 5/21/2024 19:05'
}
SPOCSearchbar >> searchTracks: aString [

	| dict apiEndpoint |
	dict := Dictionary new.
	dict at: 'input' put: (self sanitizeInput: aString);
		at: 'type' put: 'track';
		at: 'limit' put: SPOCSearchbar trackLimit;
		yourself.
	apiEndpoint := SPOCApiSearch new.
	apiEndpoint authorizer: (Smalltalk at: #auth).
	self tracks: (apiEndpoint execute: dict).
	self displayResults: tracks
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/21/2024 19:59'
}
SPOCSearchbar >> trackMorphs [
	^ trackMorphs
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/21/2024 20:00'
}
SPOCSearchbar >> trackMorphs: anOrderedCollection [
	trackMorphs := anOrderedCollection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/21/2024 15:47'
}
SPOCSearchbar >> tracks [
	^ tracks
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/21/2024 15:47'
}
SPOCSearchbar >> tracks: anOrderedCollection [
	tracks := anOrderedCollection
]
