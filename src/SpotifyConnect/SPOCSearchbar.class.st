Class {
	#name : #SPOCSearchbar,
	#superclass : #RectangleMorph,
	#instVars : [
		'inputField',
		'tracks'
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
	#'squeak_changestamp' : 'RK 5/21/2024 16:28'
}
SPOCSearchbar class >> searchbarHeight [
	^ 50
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 5/18/2024 21:33'
}
SPOCSearchbar class >> searchbarPosition [
	^ 100@100
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 5/21/2024 16:28'
}
SPOCSearchbar class >> searchbarWidth [
	^ 500
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 5/21/2024 15:33'
}
SPOCSearchbar class >> trackLimit [
	"Defines the number of search results displayed"
	^ 10
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 5/21/2024 17:03'
}
SPOCSearchbar >> buildResultMorphFrom: aTrack [
	| searchbarHeight background image albumText artistText|
	
	searchbarHeight := SPOCSearchbar searchbarHeight.
	background := RectangleMorph new
		color: SPOCStyle spotifyGray;
		extent: (SPOCSearchbar searchbarWidth@(2 * searchbarHeight));
		morphicLayerNumber: SPOCSearchbar baseLayer.
	image := (aTrack album) image.
	image position: (background position + (searchbarHeight * 0.25@(searchbarHeight * 0.25)));
		morphicLayerNumber: SPOCSearchbar baseLayer - 1.
	albumText := SPOCText newAt: (image topRight + ((searchbarHeight * 0.25)@0)) withText: aTrack name.
	artistText := SPOCText newAt: 0@0 withText: (aTrack artistsAsString).
	^ Morph new
		addMorph: background;
		addMorph: image;
		addMorph: albumText.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 5/21/2024 16:31'
}
SPOCSearchbar >> buildSearchbar [
		
	self color: SPOCStyle spotifyGray;
		extent: (SPOCSearchbar searchbarWidth@SPOCSearchbar searchbarHeight);
		position: SPOCSearchbar searchbarPosition;
		morphicLayerNumber: SPOCSearchbar baseLayer;
		inputField: (SPOCTextInput newAt: (SPOCSearchbar searchbarPosition + (10@10)) withText: 'Was möchtest du wiedergeben?');
		addMorph: self inputField;
		openInWorld;
		yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 5/21/2024 15:52'
}
SPOCSearchbar >> displayResults: anOrderedCollection [
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 5/21/2024 15:30'
}
SPOCSearchbar >> initialize [
	super initialize.
	
	self buildSearchbar
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
	#'squeak_changestamp' : 'RK 5/18/2024 20:44'
}
SPOCSearchbar >> sanitizeInput: aString [
	
	| santitizedInput |
	santitizedInput := aString copyReplaceAll: ' ' with: '+'.
	^ santitizedInput
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 5/21/2024 15:52'
}
SPOCSearchbar >> searchTracks: aString [

	| dict apiEndpoint artists |
	dict := Dictionary new.
	dict at: 'input' put: (self sanitizeInput: aString);
		at: 'type' put: 'track';
		at: 'limit' put: SPOCSearchbar trackLimit;
		yourself.
	apiEndpoint := SPOCApiSearch new.
	apiEndpoint authorizer: (Smalltalk at: #auth).
	self tracks: (apiEndpoint execute: dict).
	self displayResults: tracks.

	"Ab hier Ausgabe"
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
