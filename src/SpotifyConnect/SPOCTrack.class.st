Class {
	#name : #SPOCTrack,
	#superclass : #Object,
	#instVars : [
		'id',
		'name',
		'artists',
		'album',
		'duration',
		'explicit',
		'popularity',
		'trackNumber'
	],
	#category : #SpotifyConnect
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 16:28'
}
SPOCTrack >> album [
	^ album
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 16:28'
}
SPOCTrack >> album: anAlbum [
	album := anAlbum
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 16:28'
}
SPOCTrack >> artists [
	^ artists
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 16:29'
}
SPOCTrack >> artists: aOrderedCollection [
	artists := aOrderedCollection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/16/2024 23:44'
}
SPOCTrack >> duration [
	"In seconds"
	
	^ duration
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 16:29'
}
SPOCTrack >> duration: aNumber [
	duration := aNumber
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/16/2024 23:45'
}
SPOCTrack >> durationAsFormattedTime [
	"Converts milliseconds to 'mm:ss'"
	
	| min sec time |
	min := duration // 60.
	sec := duration \\ 60.
	time := min asString, ':', sec asString.
	^ time
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 16:28'
}
SPOCTrack >> explicit [
	^ explicit
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 16:29'
}
SPOCTrack >> explicit: aBoolean [
	explicit := aBoolean
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/13/2024 17:08'
}
SPOCTrack >> id [
	^ id
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/13/2024 17:08'
}
SPOCTrack >> id: anObject [
	id := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/13/2024 17:08'
}
SPOCTrack >> name [
	^ name
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VE 5/13/2024 17:08'
}
SPOCTrack >> name: anObject [
	name := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'RK 5/21/2024 20:28'
}
SPOCTrack >> playTrack [
	"This method should do an API call that plays this song"
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 16:28'
}
SPOCTrack >> popularity [
	^ popularity
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 16:30'
}
SPOCTrack >> popularity: aNumber [
	popularity := aNumber
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 16:28'
}
SPOCTrack >> trackNumber [
	^ trackNumber
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 16:30'
}
SPOCTrack >> trackNumber: aNumber [
	trackNumber := aNumber
]
