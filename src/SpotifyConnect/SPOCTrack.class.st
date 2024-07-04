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
	#'squeak_changestamp' : 'TL 6/23/2024 17:19'
}
SPOCTrack >> equals: aTrack [

	^ (self id = aTrack id) 
		& (self name = aTrack name) 
		& (self image equals: aTrack image)
		& (self album
			ifNil: [aTrack album = nil]
			ifNotNil: [self album equals: aTrack album])
		& (self artistsEqual: aTrack artists)
 		& (self duration = aTrack duration)
 		& (self trackNumber = aTrack trackNumber)
]

{
	#category : #actions,
	#'squeak_changestamp' : 'TL 6/24/2024 06:00'
}
SPOCTrack >> onClick: anApp [

	| filter context |
	filter := anApp searchbar filter.
	context := '"spotify:', filter, ':'.
	filter = 'track' 
			ifTrue: [SPOCApiPlay new 
				authorizer: anApp auth;
				playTrack: self id on: anApp player deviceID;
				yourself].
	(filter = 'album' or: filter = 'playlist') ifTrue: [context := context, anApp searchbar context].
	context := context, '"'.
	SPOCApiPlay new 
		authorizer: anApp auth;
		playTrack: self id withContext: context on: anApp player deviceID;
		yourself.
	anApp updatePlaybackState
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
