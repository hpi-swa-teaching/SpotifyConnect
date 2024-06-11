Class {
	#name : #SPOCTrack,
	#superclass : #SPOCDataPiece,
	#instVars : [
		'album',
		'artists',
		'duration',
		'trackNumber'
	],
	#category : #SpotifyConnect
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:55'
}
SPOCTrack >> album [

	^ album
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:55'
}
SPOCTrack >> album: anAlbum [

	album := anAlbum
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:55'
}
SPOCTrack >> artists [

	^ artists
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:56'
}
SPOCTrack >> artists: aOrderedCollection [

	artists := aOrderedCollection
]

{
	#category : #actions,
	#'squeak_changestamp' : 'TL 6/10/2024 19:59'
}
SPOCTrack >> clickAction [

	^ [self owner app player playTrack: self id]
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
	#'squeak_changestamp' : 'RK 6/7/2024 10:56'
}
SPOCTrack >> duration: aNumber [

	duration := aNumber
]

{
	#category : #formatting,
	#'squeak_changestamp' : 'TL 6/10/2024 03:55'
}
SPOCTrack >> durationAsFormattedTime [
	"Converts milliseconds to 'mm:ss'"
	
	| filler min sec time |
	min := duration // 60.
	sec := duration \\ 60.
	sec < 10 
		ifTrue: [filler := '0']
		ifFalse: [filler := ''].
	time := min asString, ':', filler, sec asString.
	^ time
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/11/2024 15:27'
}
SPOCTrack >> equals: aTrack [

	^ (self id = aTrack id) 
		& (self name = aTrack name) 
		& (self image = aTrack image)
		& (self album = aTrack album)
		& (self artists = aTrack artists)
 		& (self duration = aTrack duration)
 		& (self trackNumber = aTrack trackNumber)
]

{
	#category : #actions,
	#'squeak_changestamp' : 'TL 6/10/2024 19:59'
}
SPOCTrack >> playTrack: aString [
	
	self app player playTrack: aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:57'
}
SPOCTrack >> trackNumber [

	^ trackNumber
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:57'
}
SPOCTrack >> trackNumber: aNumber [

	trackNumber := aNumber
]
