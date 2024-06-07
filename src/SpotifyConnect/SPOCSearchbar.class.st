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
	#'squeak_changestamp' : 'RK 6/7/2024 11:02'
}
SPOCSearchbar >> buildCircle [

	^ CircleMorph new
		extent: SPOCStyle searchbarHeight asPoint;
		borderWidth: 0;
		color: SPOCStyle spotifyGray;
		yourself
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/7/2024 11:02'
}
SPOCSearchbar >> buildSearchbar [

	| leftCircle rightCircle |
	leftCircle := self buildCircle.
	rightCircle := (self buildCircle) position: self topLeft + (SPOCStyle searchbarWidth@0).
	self inputField: self buildTextInputField;
		addMorph: leftCircle;
		addMorph: rightCircle;
		addMorph: inputField;
		yourself
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/7/2024 11:02'
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
	#'squeak_changestamp' : 'RK 6/7/2024 11:03'
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
	#'squeak_changestamp' : 'RK 6/7/2024 11:03'
}
SPOCSearchbar >> inputField [

	^ inputField
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:03'
}
SPOCSearchbar >> inputField: aSPOCTextInput [

	inputField := aSPOCTextInput
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:03'
}
SPOCSearchbar >> inputText [

	^ inputText
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:03'
}
SPOCSearchbar >> inputText: aString [

	inputText:= aString.
	self changed: #inputText
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
	#category : #actions,
	#'squeak_changestamp' : 'RK 6/7/2024 11:25'
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
	self app resultList updateResults: tracks.
	self app resultList updateTitle: 'Your Results'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:03'
}
SPOCSearchbar >> trackItems [

	^ trackItems
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:04'
}
SPOCSearchbar >> trackItems: anOrderedCollection [

	trackItems := anOrderedCollection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:04'
}
SPOCSearchbar >> tracks [

	^ tracks
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:04'
}
SPOCSearchbar >> tracks: anOrderedCollection [

	tracks := anOrderedCollection
]
