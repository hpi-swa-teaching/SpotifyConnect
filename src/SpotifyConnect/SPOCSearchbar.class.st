Class {
	#name : #SPOCSearchbar,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'inputField',
		'inputText',
		'tracks',
		'trackItems'
	],
	#category : #SpotifyConnect
}

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/5/2024 22:20'
}
SPOCSearchbar >> buildCircle [
	^ CircleMorph new
		extent: SPOCStyle searchbarHeight asPoint;
		borderWidth: 0;
		color: SPOCStyle spotifyGray.
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/5/2024 22:18'
}
SPOCSearchbar >> buildSearchbar [

	| leftCircle rightCircle |
	leftCircle := self buildCircle.
	rightCircle := (self buildCircle) position: self topLeft + (SPOCStyle searchbarWidth@0).
	self inputField: self buildTextInputField;
		addMorph: leftCircle;
		addMorph: rightCircle;
		addMorph: inputField;
		yourself.
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/5/2024 22:25'
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
	textField extent: SPOCStyle searchbarWidth@SPOCStyle searchbarHeight;
		position: self topLeft + ((SPOCStyle searchbarHeight / 2)@0);
		color: SPOCStyle spotifyGray;
		borderWidth: 0;
		hScrollBarPolicy: #never;
		vScrollBarPolicy: #never;
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
	#'squeak_changestamp' : 'RK 6/5/2024 22:27'
}
SPOCSearchbar >> searchTracks: aString [
	| dict apiEndpoint |
	
	dict := Dictionary new.
	dict at: 'input' put: (self sanitizeInput: aString);
		at: 'type' put: 'track';
		at: 'limit' put: SPOCStyle resultListLimit;
		yourself.
	apiEndpoint := SPOCApiSearch new.
	apiEndpoint authorizer: self app auth.
	self tracks: (apiEndpoint execute: dict).
	self app resultList updateResults: tracks
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
