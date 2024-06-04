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
	#category : #formatting,
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
	#'squeak_changestamp' : 'VK 5/27/2024 16:27'
}
SPOCTrack >> equals: aTrack [

    ^ (self id = aTrack id) 
        & (self name = aTrack name) 
        & (self artists = aTrack artists)
        & (self album = aTrack album)
        & (self duration = aTrack duration)
        & (self explicit = aTrack explicit)
        & (self popularity = aTrack popularity)
        & (self trackNumber = aTrack trackNumber)
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
