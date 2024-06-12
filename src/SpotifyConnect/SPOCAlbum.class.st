Class {
	#name : #SPOCAlbum,
	#superclass : #SPOCDataPiece,
	#instVars : [
		'artists',
		'totalTracks'
	],
	#category : #SpotifyConnect
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
	#category : #formatting,
	#'squeak_changestamp' : 'TL 6/10/2024 03:54'
}
SPOCAlbum >> artistsAsString [

	| result |
	result := ''.
	self artists allButLastDo: [:artist | result := result, artist name, ', '].
	result := result, self artists last name.
	^ result
]

{
	#category : #actions,
	#'squeak_changestamp' : 'RK 6/7/2024 11:18'
}
SPOCAlbum >> clickAction [

	^ ["To do: show all tracks from this album in resultList"]
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
