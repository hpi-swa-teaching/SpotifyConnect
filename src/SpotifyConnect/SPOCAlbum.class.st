Class {
	#name : #SPOCAlbum,
	#superclass : #SPOCDataPiece,
	#instVars : [
		'totalTracks',
		'releaseDate',
		'releaseDatePrecision',
		'type',
		'artists',
		'genres',
		'popularity'
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
	#'squeak_changestamp' : 'RK 6/6/2024 00:47'
}
SPOCAlbum >> equals: anAlbum [

    ^ (self id = anAlbum id) 
        & (self name = anAlbum name) 
        & (self albumType = anAlbum albumType)
        & (self totalTracks = anAlbum totalTracks)
        & (self releaseDate = anAlbum releaseDate)
        & (self releaseDatePrecision = anAlbum releaseDatePrecision)
        & (self type = anAlbum type)
        & (self artists = anAlbum artists)
        & (self genres = anAlbum genres)
        & (self popularity = anAlbum popularity)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:52'
}
SPOCAlbum >> genres [

	^ genres
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:53'
}
SPOCAlbum >> genres: anOrderedCollection [

	genres := anOrderedCollection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:53'
}
SPOCAlbum >> popularity [

	^ popularity
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:53'
}
SPOCAlbum >> popularity: aNumber [

	popularity := aNumber
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:53'
}
SPOCAlbum >> releaseDate [

	^ releaseDate
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:53'
}
SPOCAlbum >> releaseDate: aString [

	releaseDate := aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:53'
}
SPOCAlbum >> releaseDatePrecision [

	^ releaseDatePrecision
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:53'
}
SPOCAlbum >> releaseDatePrecision: aString [

	releaseDatePrecision := aString
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

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:53'
}
SPOCAlbum >> type [

	^ type
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:53'
}
SPOCAlbum >> type: aString [

	type := aString
]
