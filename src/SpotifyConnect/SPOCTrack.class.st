"
I represent a track (song)
"
Class {
	#name : #SPOCTrack,
	#superclass : #SPOCDataPiece,
	#instVars : [
		'album',
		'artists',
		'duration',
		'trackNumber'
	],
	#category : #SpotifyConnect,
	#'squeak_changestamp' : 'OW 7/4/2024 11:54'
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
	#'squeak_changestamp' : 'TL 7/7/2024 02:32'
}
SPOCTrack >> album: aSPOCAlbum [

	album := aSPOCAlbum
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
	#'squeak_changestamp' : 'TL 7/7/2024 02:32'
}
SPOCTrack >> artists: anOrderedCollection [

	artists := anOrderedCollection
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
	#'squeak_changestamp' : 'TL 6/23/2024 14:57'
}
SPOCTrack >> durationAsFormattedTime [
	"Converts milliseconds to 'mm:ss'"
	
	| filler min sec time |
	min := self duration // 60.
	sec := self duration \\ 60.
	sec < 10 
		ifTrue: [filler := '0']
		ifFalse: [filler := ''].
	time := min asString, ':', filler, sec asString.
	^ time
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 7/7/2024 00:01'
}
SPOCTrack >> equals: aTrack [

	^ (self id = aTrack id) 
		& (self name = aTrack name) 
		& (self image
			ifNil: [^ true]
			ifNotNil: [self image equals: aTrack image])
		& (self album
			ifNil: [^ true]
			ifNotNil: [self album equals: aTrack album])
		& (self artistsEqual: aTrack artists)
 		& (self duration = aTrack duration)
 		& (self trackNumber = aTrack trackNumber)
]

{
	#category : #'event-handling',
	#'squeak_changestamp' : 'TL 7/8/2024 19:28'
}
SPOCTrack >> onClick: anApp [

	| filter endpoint|
	filter := anApp searchbar filter.
	endpoint := SPOCApiPlay new authorizer: anApp auth.
	filter = 'track' 
			ifTrue: [endpoint playTrack: self id on: anApp player deviceID].
	filter = 'album' 
		ifTrue: [endpoint playTrack: self id withAlbum: anApp searchbar context on: anApp player deviceID].
	filter = 'playlist' 
		ifTrue: [endpoint playTrack: self id withPlaylist: anApp searchbar context on: anApp player deviceID].
	anApp updatePlaybackState
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 7/7/2024 12:34'
}
SPOCTrack >> secondaryText [

	^ self artistsAsString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 7/7/2024 12:42'
}
SPOCTrack >> tertiaryText [

	^ self durationAsFormattedTime
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
