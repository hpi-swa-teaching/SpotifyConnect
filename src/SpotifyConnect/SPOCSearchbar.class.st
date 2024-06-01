Class {
	#name : #SPOCSearchbar,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'inputField',
		'tracks',
		'trackMorphs',
		'resultDisplay'
	],
	#category : #SpotifyConnect
}

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 5/21/2024 22:31'
}
SPOCSearchbar class >> baseLayer [
	^ 500
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 5/30/2024 22:46'
}
SPOCSearchbar class >> searchbarHeight [
	^ 32
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 5/30/2024 22:16'
}
SPOCSearchbar class >> searchbarPosition [
	^ 0@0
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 5/30/2024 22:48'
}
SPOCSearchbar class >> searchbarWidth [
	^ 800
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 5/22/2024 12:54'
}
SPOCSearchbar class >> trackLimit [
	"Defines the number of search results displayed"
	^ 10
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 5/30/2024 23:17'
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
		color: Color transparent;
		addMorph: background;
		addMorph: image;
		addMorph: trackText;
		addMorph: artistText;
		vResizing: #shrinkWrap;
		yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 5/31/2024 01:14'
}
SPOCSearchbar >> buildSearchbar [

	| leftCircle center rightCircle |
	leftCircle := CircleMorph new
		extent: SPOCSearchbar searchbarHeight asPoint;
		borderWidth: 0;
		color: SPOCStyle spotifyGray.
	center := RectangleMorph new
		color: SPOCStyle spotifyGray;
		extent: (SPOCSearchbar searchbarWidth@SPOCSearchbar searchbarHeight);
		position: self topLeft + ((SPOCSearchbar searchbarHeight / 2)@0);
		borderWidth: 0;
		morphicLayerNumber: SPOCSearchbar baseLayer;
		yourself.
	rightCircle := CircleMorph new
		extent: SPOCSearchbar searchbarHeight asPoint;
		position: self topLeft + (SPOCSearchbar searchbarWidth@0);
		borderWidth: 0;
		color: SPOCStyle spotifyGray.
	self inputField: (SPOCTextInput newAt: (self position + (SPOCSearchbar searchbarHeight@0)) withText: 'Was möchtest du wiedergeben?');
		resultDisplay: SPOCScrollablePanel new;
		addMorph: leftCircle;
		addMorph: center;
		addMorph: rightCircle;
		addMorph: self inputField;
		addMorph: resultDisplay;
		yourself.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 6/1/2024 10:43'
}
SPOCSearchbar >> displayResults: anOrderedCollection [
	
	"To do: Scrollable Panel als Teil der Searchbar anzeigen lassen"
	self resultDisplay: SPOCScrollablePanel new.
	self resultDisplay items: anOrderedCollection;
		buildItemMorphsWith: [ :value | self buildResultMorphFrom: value];
		buildPanelAtPos: self bottomLeft withExtent: (SPOCSearchbar searchbarWidth + SPOCSearchbar searchbarHeight)@(SPOCSearchbar searchbarHeight * 10);
		yourself.
	self addMorph: resultDisplay;
		extendFully;
		yourself
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 5/30/2024 22:08'
}
SPOCSearchbar >> initialize [
	super initialize.
	
	self
		color: Color transparent;
		trackMorphs: OrderedCollection new;
		tracks: OrderedCollection new;
		buildSearchbar;
		extendFully;
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
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/31/2024 01:02'
}
SPOCSearchbar >> resultDisplay [
	^ resultDisplay
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/31/2024 01:12'
}
SPOCSearchbar >> resultDisplay: aMorph [
	resultDisplay := aMorph
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
	#'squeak_changestamp' : 'RK 5/30/2024 21:03'
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
	self displayResults: tracks.
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
