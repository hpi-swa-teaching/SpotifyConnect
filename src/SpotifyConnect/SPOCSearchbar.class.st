Class {
	#name : #SPOCSearchbar,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'inputField',
		'inputText',
		'tracks',
		'trackItems',
		'filter'
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
	#'squeak_changestamp' : 'RK 6/13/2024 23:56'
}
SPOCSearchbar >> buildInputField [
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
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/14/2024 01:30'
}
SPOCSearchbar >> buttonClicked: aButton [
	
	| names |
	names := OrderedCollection withAll: #('track' 'album' 'playlist').
	names do: [ :aName | (self submorphNamed: aName ) wrappee color: SPOCStyle spotifyWhite].	
	aButton wrappee color: SPOCStyle spotifyGreen.
	self filter: aButton externalName
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
	#'squeak_changestamp' : 'RK 6/14/2024 01:38'
}
SPOCSearchbar >> initialize [

	super initialize.
	
	self color: Color transparent;
		trackItems: OrderedCollection new;
		tracks: OrderedCollection new;
		buildSearchbar;
		disabled: true;
		buttonClicked: (self submorphNamed: 'track');
		extendFully
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
	#'squeak_changestamp' : 'RK 6/14/2024 01:31'
}
SPOCSearchbar >> searchTracks: aString [

	| apiEndpoint dict |
	dict := Dictionary new
		at: #input put: (self sanitizeInput: aString);
		at: #type put: self filter;
		at: #limit put: SPOCStyle resultListLimit;
		yourself.
	apiEndpoint := SPOCApiSearch new
		authorizer: self app auth;
		yourself.
	self tracks: (apiEndpoint execute: dict).
	self app resultList updateResults: self tracks;
		title: 'Your Results'
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
