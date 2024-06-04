Class {
	#name : #SPOCSearchbar,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'inputField',
		'inputText',
		'tracks',
		'resultList',
		'trackItems'
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
	#'squeak_changestamp' : 'VE 6/3/2024 10:31'
}
SPOCSearchbar class >> searchbarHeight [
	^ 32
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'OW 6/3/2024 13:15'
}
SPOCSearchbar class >> searchbarToResultRatio [
	"Defines the ratio between the height of the searchbar and the height of a resultMorph"
	^ 3
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 6/1/2024 22:49'
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
	#'squeak_changestamp' : 'RK 6/4/2024 23:46'
}
SPOCSearchbar >> buildResultDisplay [
	"Done"

	^ SPOCScrollablePanel new
		buildPanelAtPos: (self topLeft + (0@SPOCSearchbar searchbarHeight)) withExtent: (SPOCSearchbar searchbarWidth + SPOCSearchbar searchbarHeight)@(SPOCSearchbar searchbarHeight * 10);
		hide
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/5/2024 01:12'
}
SPOCSearchbar >> buildResultMorphFrom: aTrack [
	"Done"
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
	trackText text addAttribute: TextEmphasis bold.
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
	#'squeak_changestamp' : 'RK 6/5/2024 01:13'
}
SPOCSearchbar >> buildSearchbar [

	| leftCircle rightCircle |
	leftCircle := self buildCircle.
	rightCircle := (self buildCircle) position: self topLeft + (SPOCStyle searchbarWidth@0).
	self inputField: self buildTextInputField;
		resultList: self buildResultDisplay. "Kann weg, weil resultList nicht mehr Submorph"
	self addMorph: leftCircle;
		addMorph: rightCircle;
		addMorph: inputField;
		addMorph: resultList;
		yourself.
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/4/2024 23:57'
}
SPOCSearchbar >> buildTextInputField [
	"To do: specification irgendwie auslagern, damit Methode kürzer"
	| builder spec textField |
	
	builder := ToolBuilder default.
	spec := builder pluggableTextSpec new
		model: self;
		plainTextOnly: true;
		getText: #inputText;
		setText: #searchTracks:;
		indicateUnacceptedChanges: false;
		help: 'Was möchtest du wiedergeben?';
		yourself.
	textField := builder build: spec.
	textField extent: SPOCSearchbar searchbarWidth@SPOCSearchbar searchbarHeight;
		position: self topLeft + ((SPOCSearchbar searchbarHeight / 2)@0);
		color: SPOCStyle spotifyGray;
		borderWidth: 0;
		hScrollBarPolicy: #never;
		vScrollBarPolicy: #never;
		morphicLayerNumber: SPOCSearchbar baseLayer;
		acceptOnCR: true;
		yourself.
	 ^ textField
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 6/4/2024 12:14'
}
SPOCSearchbar >> initialize [
	super initialize.
	
	self
		color: Color transparent;
		trackItems: OrderedCollection new;
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
	#'squeak_changestamp' : 'RK 6/1/2024 22:34'
}
SPOCSearchbar >> inputText [
	^ inputText
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/1/2024 22:34'
}
SPOCSearchbar >> inputText: aString [
	inputText:= aString.
	self changed: #inputText
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 6/4/2024 14:55'
}
SPOCSearchbar >> playTrack: aString [
	"self app player playSong: aString"
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/4/2024 12:01'
}
SPOCSearchbar >> resultList [
	^ resultList
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/4/2024 12:02'
}
SPOCSearchbar >> resultList: aMorph [
	resultList := aMorph
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
	#'squeak_changestamp' : 'RK 6/4/2024 14:43'
}
SPOCSearchbar >> searchTracks: aString [
	| dict apiEndpoint |
	
	dict := Dictionary new.
	dict at: 'input' put: (self sanitizeInput: aString);
		at: 'type' put: 'track';
		at: 'limit' put: SPOCSearchbar trackLimit;
		yourself.
	apiEndpoint := SPOCApiSearch new.
	apiEndpoint authorizer: self app auth.
	self tracks: (apiEndpoint execute: dict).
	self updateResultDisplay: tracks. "auf resultList updateResults: tracks"
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/4/2024 12:14'
}
SPOCSearchbar >> trackItems [
	^ trackItems
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/4/2024 12:14'
}
SPOCSearchbar >> trackItems: anOrderedCollection [
	trackItems := anOrderedCollection
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
	#'squeak_changestamp' : 'RK 6/4/2024 23:58'
}
SPOCSearchbar >> updateResultDisplay: anOrderedCollection [
	
	resultList items: anOrderedCollection;
		buildItemMorphsWith: [:value | self buildResultMorphFrom: value];
		updatePanel;
		show;
		yourself.
	self extendFully
]
