"
concrete class for the searchbar morph component
"
Class {
	#name : #SPOCSearchbar,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'context',
		'filter',
		'input',
		'items',
		'results'
	],
	#category : #'SpotifyConnect-UI',
	#'squeak_changestamp' : 'OW 7/4/2024 12:14'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'VE 7/8/2024 17:46'
}
SPOCSearchbar class >> inputFieldHelp [
	
	^ 'Was möchtest du wiedergeben?'
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 7/8/2024 17:13'
}
SPOCSearchbar class >> searchbarHeight [

	^ 32
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 7/8/2024 17:13'
}
SPOCSearchbar class >> searchbarWidth [

	^ 600
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 7/11/2024 19:15'
}
SPOCSearchbar >> attachButtons [

	| trackButton albumsButton playlistsButton |
	trackButton := self buildButtonWithText: 'Tracks' at: self bottomLeft name: 'track'.
	trackButton wrappee color: SPOCStyle spotifyGreen.
	albumsButton := self buildButtonWithText: 'Albums'
			at: (trackButton topRight + (SPOCStyle defaultMargin @ 0))
			name: 'album'.
	playlistsButton := self buildButtonWithText: 'Playlists'
			at: (albumsButton topRight + (SPOCStyle defaultMargin @ 0))
			name: 'playlist'.
	self addMorph: trackButton;
		addMorph: albumsButton;
		addMorph: playlistsButton
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 7/8/2024 20:20'
}
SPOCSearchbar >> attachInputField [
	
	| textField |
	textField := self buildInputTextField.
	textField extent: self class searchbarWidth @ self class searchbarHeight;
		position: self topLeft + ((self class searchbarHeight / 2) @ 0);
		color: SPOCStyle spotifyGray;
		borderWidth: 0;
		hScrollBarPolicy: #never;
		vScrollBarPolicy: #never;
		acceptOnCR: true;
		setProperty: #indicateKeyboardFocus toValue: #never.
	 self addMorph: textField
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 7/8/2024 17:56'
}
SPOCSearchbar >> attachSearchbar [

	| leftCircle rightCircle |
	leftCircle := self buildCircle.
	rightCircle := self buildCircle position: self topLeft + (self class searchbarWidth @ 0).
	self addMorph: leftCircle;
		addMorph: rightCircle;
		attachInputField;
		attachButtons
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 7/11/2024 17:22'
}
SPOCSearchbar >> buildButtonWithText: aString at: aPosition name: aName [

	^ (SPOCClickable newUsing: (SPOCBoxedText new contents: aString)
			onClick: [:anEvent | self buttonClicked: anEvent handler])
		position: aPosition;
		name: aName;
		yourself
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 7/11/2024 17:21'
}
SPOCSearchbar >> buildCircle [

	^ CircleMorph new extent: self class searchbarHeight asPoint;
		borderWidth: 0;
		color: SPOCStyle spotifyGray;
		yourself
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 7/11/2024 17:22'
}
SPOCSearchbar >> buildInputTextField [
	
	| builder spec |
	builder := ToolBuilder default.
	spec := builder pluggableTextSpec new model: self;
		plainTextOnly: true;
		getText: #input;
		setText: #search:;
		indicateUnacceptedChanges: false;
		help: self class inputFieldHelp;
		yourself.
	^ builder build: spec
]

{
	#category : #actions,
	#'squeak_changestamp' : 'TL 7/8/2024 19:48'
}
SPOCSearchbar >> buttonClicked: aButton [
	
	self resetButtonColors.
	aButton wrappee color: SPOCStyle spotifyGreen.
	self filter: aButton externalName.
	self input
		ifNotNil: [self search: self input]
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
	#'squeak_changestamp' : 'TL 7/8/2024 19:25'
}
SPOCSearchbar >> initialize [

	super initialize.
	
	self color: Color transparent;
		items: OrderedCollection new;
		results: OrderedCollection new;
		attachSearchbar;
		filter: 'track';
		extendFully
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
	#category : #actions,
	#'squeak_changestamp' : 'VE 7/8/2024 17:41'
}
SPOCSearchbar >> resetButtonColors [

	#('track' 'album' 'playlist') do: [ :aName | (self submorphNamed: aName) wrappee color: SPOCStyle spotifyWhite]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/15/2024 16:41'
}
SPOCSearchbar >> results [

	^ results
]

{
	#category : #accessing,
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
	#'squeak_changestamp' : 'TL 7/8/2024 19:26'
}
SPOCSearchbar >> search: aString [

	| apiEndpoint |
	self isDisabled
		ifTrue: [self showPopUp.
			^ self].
	apiEndpoint := SPOCApiSearch new authorizer: self app auth.
	self input: aString;
		results: (apiEndpoint search: (self sanitizeInput: aString) withFilter: self filter).
	self app resultList updateResults: self results;
		title: 'Your Results'
		
]
