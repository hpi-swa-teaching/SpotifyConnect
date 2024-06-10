Class {
	#name : #SPOCTrack,
	#superclass : #SPOCDataModel,
	#instVars : [
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
	#'squeak_changestamp' : 'RK 6/7/2024 12:22'
}
SPOCTrack >> clickAction [

	^ [self owner app player playSong: self id]
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
	#'squeak_changestamp' : 'RK 6/6/2024 00:49'
}
SPOCTrack >> equals: aTrack [

    ^ (self id = aTrack id) 
        & (self name = aTrack name)
	  & (self image = aTrack image)
        & (self artists = aTrack artists)
        & (self album = aTrack album)
        & (self duration = aTrack duration)
        & (self explicit = aTrack explicit)
        & (self popularity = aTrack popularity)
        & (self trackNumber = aTrack trackNumber)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:56'
}
SPOCTrack >> explicit [

	^ explicit
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:56'
}
SPOCTrack >> explicit: aBoolean [

	explicit := aBoolean
]

{
	#category : #actions,
	#'squeak_changestamp' : 'RK 6/7/2024 10:56'
}
SPOCTrack >> playTrack: aString [
	
	self app player playSong: aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:56'
}
SPOCTrack >> popularity [

	^ popularity
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:57'
}
SPOCTrack >> popularity: aNumber [

	popularity := aNumber
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
