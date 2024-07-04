"
I represent an album
"
Class {
	#name : #SPOCAlbum,
	#superclass : #SPOCDataPiece,
	#instVars : [
		'artists',
		'totalTracks'
	],
	#category : #SpotifyConnect,
	#'squeak_changestamp' : 'OW 7/4/2024 11:53'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:52'
}
SPOCAlbum >> artists [

	^ artists
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:52'
}
SPOCAlbum >> artists: anOrderedCollection [

	artists := anOrderedCollection
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/12/2024 01:20'
}
SPOCAlbum >> equals: anAlbum [

	^ (self id = anAlbum id) 
		& (self name = anAlbum name) 
		& (self image equals: anAlbum image)
 		& (self artistsEqual: anAlbum artists)
		& (self totalTracks = anAlbum totalTracks)
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'VE 7/2/2024 19:09'
}
SPOCAlbum >> onClick: anApp [

	| apiEndpoint results |
	apiEndpoint := SPOCApiAlbum new authorizer: anApp auth.
	results := apiEndpoint getAlbumWithID: self id.
	results do: [ :aResult |
		aResult artists: self artists;
			image: self image;
			yourself].
	anApp searchbar context: self id.
	anApp resultList updateResults: results;
		title: self name.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:53'
}
SPOCAlbum >> totalTracks [

	^ totalTracks
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:53'
}
SPOCAlbum >> totalTracks: aNumber [

	totalTracks := aNumber
]
