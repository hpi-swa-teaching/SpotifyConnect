Class {
	#name : #SPOCSearchbar,
	#superclass : #RectangleMorph,
	#instVars : [
		'inputField'
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
	#'squeak_changestamp' : 'RK 5/17/2024 10:59'
}
SPOCSearchbar class >> searchbarExtent [
	^ 500@50
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 5/18/2024 21:33'
}
SPOCSearchbar class >> searchbarPosition [
	^ 100@100
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 5/18/2024 21:51'
}
SPOCSearchbar >> buildComponents [
		
	self color: SPOCStyle spotifyGray;
		extent: SPOCSearchbar searchbarExtent;
		position: SPOCSearchbar searchbarPosition;
		morphicLayerNumber: SPOCSearchbar baseLayer;
		inputField: (SPOCTextInput newAt: (SPOCSearchbar searchbarPosition + (10@10)) withText: 'Was möchtest du wiedergeben?');
		addMorph: self inputField;
		openInWorld;
		yourself
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 5/18/2024 21:30'
}
SPOCSearchbar >> initialize [
	super initialize.
	
	self buildComponents
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
	#'squeak_changestamp' : 'RK 5/18/2024 20:44'
}
SPOCSearchbar >> sanitizeInput: aString [
	
	| santitizedInput |
	santitizedInput := aString copyReplaceAll: ' ' with: '+'.
	^ santitizedInput
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 5/18/2024 21:57'
}
SPOCSearchbar >> searchTracks: aString [

	| dict apiEndpoint tracks artists |
	dict := Dictionary new.
	dict at: 'input' put: (self sanitizeInput: aString);
		at: 'type' put: 'track';
		at: 'limit' put: '8';
		yourself.
	apiEndpoint := SPOCApiSearch new.
	apiEndpoint authorizer: (Smalltalk at: #auth).
	tracks := apiEndpoint execute: dict.
	tracks do: [ :track |
		Transcript showln: 'Title:', String tab, track name;
			showln: 'Album:', String tab, track album name;
			showln: 'Artists:', String tab.
		artists := track artists.
		artists do: [ :artist |
			Transcript show: artist name;
				show: ' ' ].
		Transcript showln: ' ' ]
]
