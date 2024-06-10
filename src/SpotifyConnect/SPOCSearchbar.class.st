Class {
	#name : #SPOCSearchbar,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'inputField',
		'inputText',
		'tracks',
		'trackItems',
		'disabled'
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
	#'squeak_changestamp' : 'TL 6/10/2024 04:20'
}
SPOCSearchbar >> buildSearchbar [

	| leftCircle rightCircle |
	leftCircle := self buildCircle.
	rightCircle := self buildCircle position: self topLeft + (SPOCStyle searchbarWidth @ 0).
	self inputField: self buildTextInputField;
		addMorph: leftCircle;
		addMorph: rightCircle;
		addMorph: self inputField;
		yourself
]

{
	#category : #building,
	#'squeak_changestamp' : 'TL 6/10/2024 04:21'
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
	textField extent: SPOCStyle searchbarWidth @ SPOCStyle searchbarHeight;
		position: self topLeft + ((SPOCStyle searchbarHeight / 2) @ 0);
		color: SPOCStyle spotifyGray;
		borderWidth: 0;
		hScrollBarPolicy: #never;
		vScrollBarPolicy: #never;
		acceptOnCR: true;
		setProperty: #indicateKeyboardFocus toValue: #never;
		yourself.
	 ^ textField
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/9/2024 13:17'
}
SPOCSearchbar >> disabled [

	^ disabled
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/9/2024 13:17'
}
SPOCSearchbar >> disabled: aBoolean [

	disabled := aBoolean
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 6/10/2024 04:22'
}
SPOCSearchbar >> initialize [

	super initialize.
	
	self color: Color transparent;
		trackItems: OrderedCollection new;
		tracks: OrderedCollection new;
		disabled: true;
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
	#'squeak_changestamp' : 'TL 6/10/2024 04:21'
}
SPOCSearchbar >> sanitizeInput: aString [
	
	^ aString copyReplaceAll: ' ' with: '+'
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/10/2024 04:19'
}
SPOCSearchbar >> searchTracks: aString [

	| apiEndpoint dict |
	self disabled
		ifTrue: [UIManager inform: 'Please log in!'.
			^ self].
	dict := Dictionary new
		at: #input put: (self sanitizeInput: aString);
		at: #type put: 'track';
		at: #limit put: SPOCStyle resultListLimit;
		yourself.
	apiEndpoint := SPOCApiSearch new
		authorizer: self app auth;
		yourself.
	self tracks: (apiEndpoint execute: dict).
	self app resultList updateResults: self tracks;
		title: 'Your Results'.
	self app currentlyPlaying update
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
