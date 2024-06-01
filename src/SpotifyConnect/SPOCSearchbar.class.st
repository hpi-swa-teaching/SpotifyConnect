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
	#'squeak_changestamp' : 'RK 6/1/2024 18:12'
}
SPOCSearchbar class >> resultBorder [
	"Defines the thickness of the inner border that appears in a resultMorph"
	^ 10
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 6/1/2024 15:46'
}
SPOCSearchbar class >> searchbarHeight [
	^ 42
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 6/1/2024 18:13'
}
SPOCSearchbar class >> searchbarToResultRatio [
	"Defines the ratio between the height of the searchbar and the height of a resultMorph"
	^ 2
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
	#category : #building,
	#'squeak_changestamp' : 'RK 6/1/2024 11:58'
}
SPOCSearchbar >> buildCircle [
	^ CircleMorph new
		extent: SPOCSearchbar searchbarHeight asPoint;
		borderWidth: 0;
		color: SPOCStyle spotifyGray.
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/1/2024 15:41'
}
SPOCSearchbar >> buildResultDisplay [

	^ SPOCScrollablePanel new
		buildPanelAtPos: (self topLeft + (0@SPOCSearchbar searchbarHeight)) withExtent: (SPOCSearchbar searchbarWidth + SPOCSearchbar searchbarHeight)@(SPOCSearchbar searchbarHeight * 10);
		hide
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/1/2024 18:58'
}
SPOCSearchbar >> buildResultMorphFrom: aTrack [
	| height width border ratio background image trackText artistText durationText result clickResult |
	
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
	
	result := Morph new color: Color transparent;
		addMorph: background;
		addMorph: image;
		addMorph: trackText;
		addMorph: artistText;
		addMorph: durationText;
		borderWidth: 1;
		vResizing: #shrinkWrap;
		yourself.
	clickResult := SPOCClickable newUsing: result onClick: [:evt | self playTrack: aTrack id].
	clickResult vResizing: #shrinkWrap.
	^ clickResult
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/1/2024 14:03'
}
SPOCSearchbar >> buildSearchbar [

	| leftCircle text rightCircle display |
	leftCircle := self buildCircle.
	text := self buildTextInputField.
	rightCircle := (self buildCircle) position: self topLeft + (SPOCSearchbar searchbarWidth@0).
	display := self buildResultDisplay.
	self inputField: text;
		resultDisplay: display;
		addMorph: leftCircle;
		addMorph: rightCircle;
		addMorph: self inputField;
		addMorph: resultDisplay;
		yourself.
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/1/2024 19:06'
}
SPOCSearchbar >> buildTextInputField [

	| textField |
	textField := PluggableTextMorphPlus new
		extent: SPOCSearchbar searchbarWidth@SPOCSearchbar searchbarHeight;
		position: self topLeft + ((SPOCSearchbar searchbarHeight / 2)@0);
		color: SPOCStyle spotifyGray;
		borderWidth: 0;
		hScrollBarPolicy: #never;
		vScrollBarPolicy: #never;
		morphicLayerNumber: SPOCSearchbar baseLayer;
		balloonText: 'Was möchtest du wiedergeben?';
		acceptOnCR: true;
		acceptAction: [:text | self searchTracks: 'Giant Rooks']; "Hier müsste eigentlich text übergeben werden"
		yourself.
	textField textMorph centered.
	^ textField
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/1/2024 19:07'
}
SPOCSearchbar >> hideResults [
	self resultDisplay hide
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 6/1/2024 13:14'
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 6/1/2024 18:38'
}
SPOCSearchbar >> playTrack: aString [
	"In this method, the track is to be played according to the given ID"
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
	#category : #formatting,
	#'squeak_changestamp' : 'RK 5/18/2024 20:44'
}
SPOCSearchbar >> sanitizeInput: aString [
	
	| santitizedInput |
	santitizedInput := aString copyReplaceAll: ' ' with: '+'.
	^ santitizedInput
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 6/1/2024 18:21'
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
	self updateResultDisplay: tracks.
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

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/1/2024 19:07'
}
SPOCSearchbar >> updateResultDisplay: anOrderedCollection [
	
	anOrderedCollection ifNil: [self hideResults.
		^ self].
	resultDisplay items: anOrderedCollection;
		buildItemMorphsWith: [:value | self buildResultMorphFrom: value];
		updatePanel;
		show;
		yourself.
	self extendFully
]
