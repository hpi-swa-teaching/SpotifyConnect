Class {
	#name : #SPOCSearchbar,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'inputField',
		'input',
		'results',
		'items',
		'filter',
		'context'
	],
	#category : #'SpotifyConnect-UI'
}

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/14/2024 01:37'
}
SPOCSearchbar >> buildButtonWithText: aString at: aPosition [

	^ ((SPOCClickable
		newUsing: (SPOCBoxedText new contents: aString)
		onClick: [:anEvent | self buttonClicked: anEvent handler])
		position: aPosition;
		name: ((aString asLowercase) allButLast: 's' size);
		yourself)
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/14/2024 01:32'
}
SPOCSearchbar >> buildButtons [

	| trackButton albumsButton playlistsButton |
	trackButton := self buildButtonWithText: 'Tracks'
		at: self bottomLeft.
	albumsButton := self buildButtonWithText: 'Albums'
		at: trackButton topRight + (SPOCStyle defaultMargin @ 0).
	playlistsButton := self buildButtonWithText: 'Playlists'
		at: albumsButton topRight + (SPOCStyle defaultMargin @ 0).
	self addMorph: trackButton;
		addMorph: albumsButton;
		addMorph: playlistsButton;
		yourself.
]

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
	#'squeak_changestamp' : 'RK 6/16/2024 13:01'
}
SPOCSearchbar >> buildInputField [
	"To do: specification irgendwie auslagern, damit Methode kürzer"
	
	| builder spec textField |
	builder := ToolBuilder default.
	spec := builder pluggableTextSpec new
		model: self;
		plainTextOnly: true;
		getText: #input;
		setText: #search:;
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
	 self addMorph: textField
]

{
	#category : #building,
	#'squeak_changestamp' : 'RK 6/14/2024 00:18'
}
SPOCSearchbar >> buildSearchbar [

	| leftCircle rightCircle |
	leftCircle := self buildCircle.
	rightCircle := self buildCircle position: self topLeft + (SPOCStyle searchbarWidth @ 0).
	self addMorph: leftCircle;
		addMorph: rightCircle;
		buildInputField;
		buildButtons;
		yourself
]

{
	#category : #actions,
	#'squeak_changestamp' : 'TL 6/23/2024 16:51'
}
SPOCSearchbar >> buttonClicked: aButton [
	
	| names |
	names := OrderedCollection withAll: #('track' 'album' 'playlist').
	names do: [ :aName | (self submorphNamed: aName ) wrappee color: SPOCStyle spotifyWhite].	
	aButton wrappee color: SPOCStyle spotifyGreen.
	self filter: aButton externalName.
	self input ifNotNil: [self search: self input]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/16/2024 13:45'
}
SPOCSearchbar >> context [

	^ context
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/16/2024 13:45'
}
SPOCSearchbar >> context: aString [

	context := aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/14/2024 01:12'
}
SPOCSearchbar >> filter [

	^ filter
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/14/2024 01:12'
}
SPOCSearchbar >> filter: aString [

	filter := aString
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 7/2/2024 17:53'
}
SPOCSearchbar >> initialize [

	super initialize.
	
	self color: Color transparent;
		items: OrderedCollection new;
		results: OrderedCollection new;
		buildSearchbar;
		isDisabled: true;
		filter: 'track';
		extendFully.
	(self submorphNamed: 'track') wrappee color: SPOCStyle spotifyGreen
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/15/2024 17:10'
}
SPOCSearchbar >> input [

	^ input
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/16/2024 13:01'
}
SPOCSearchbar >> input: aString [

	input := aString.
	self changed: #input
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/15/2024 16:41'
}
SPOCSearchbar >> items [

	^ items
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/15/2024 16:41'
}
SPOCSearchbar >> items: anOrderedCollection [

	items := anOrderedCollection
]

{
	#category : #building,
	#'squeak_changestamp' : 'VE 7/2/2024 18:46'
}
SPOCSearchbar >> needsLogin [
	
	^ true

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/15/2024 16:41'
}
SPOCSearchbar >> results [

	^ results
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 6/15/2024 16:42'
}
SPOCSearchbar >> results: anOrderedCollection [

	results := anOrderedCollection
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
	#'squeak_changestamp' : 'VE 7/2/2024 18:57'
}
SPOCSearchbar >> search: aString [

	| apiEndpoint |
	self isDisabled ifTrue: [self showPopUp. ^ self].
	apiEndpoint := SPOCApiSearch new authorizer: self app auth.
	self input: aString;
		results: (apiEndpoint search: (self sanitizeInput: aString) withFilter: self filter).
	self app resultList updateResults: self results;
		title: 'Your Results'
		
]
