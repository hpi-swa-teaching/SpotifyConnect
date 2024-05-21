Class {
	#name : #SPOCAlbum,
	#superclass : #Object,
	#instVars : [
		'id',
		'name',
		'albumType',
		'totalTracks',
		'image',
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
	#'squeak_changestamp' : 'RK 5/15/2024 14:41'
}
SPOCAlbum >> albumType [
	^ albumType
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 14:43'
}
SPOCAlbum >> albumType: aString [
	albumType := aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 14:45'
}
SPOCAlbum >> artists [
	^ artists
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 14:58'
}
SPOCAlbum >> artists: anOrderedCollection [
	artists := anOrderedCollection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 14:45'
}
SPOCAlbum >> genres [
	^ genres
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 14:45'
}
SPOCAlbum >> genres: anObject [
	genres := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 14:42'
}
SPOCAlbum >> id [
	^ id
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 14:53'
}
SPOCAlbum >> id: aString [
	id := aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 16:14'
}
SPOCAlbum >> image [
	^ image
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 16:15'
}
SPOCAlbum >> image: anImage [
	image := anImage
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 14:42'
}
SPOCAlbum >> name [
	^ name
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 14:55'
}
SPOCAlbum >> name: aString [
	name := aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 14:46'
}
SPOCAlbum >> popularity [
	^ popularity
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 14:46'
}
SPOCAlbum >> popularity: anObject [
	popularity := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 14:44'
}
SPOCAlbum >> releaseDate [
	^ releaseDate
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 14:56'
}
SPOCAlbum >> releaseDate: aString [
	releaseDate := aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 14:44'
}
SPOCAlbum >> releaseDatePrecision [
	^ releaseDatePrecision
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 14:56'
}
SPOCAlbum >> releaseDatePrecision: aString [
	releaseDatePrecision := aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 14:41'
}
SPOCAlbum >> totalTracks [
	^ totalTracks
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 14:47'
}
SPOCAlbum >> totalTracks: aNumber [
	totalTracks := aNumber
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 14:44'
}
SPOCAlbum >> type [
	^ type
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 14:57'
}
SPOCAlbum >> type: aString [
	type := aString
]
