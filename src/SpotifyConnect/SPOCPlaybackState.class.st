Class {
	#name : #SPOCPlaybackState,
	#superclass : #Object,
	#instVars : [
		'device',
		'isPlaying',
		'progressMS',
		'track'
	],
	#category : #SpotifyConnect
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/7/2024 18:03'
}
SPOCPlaybackState >> device [
	^ device
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/7/2024 18:03'
}
SPOCPlaybackState >> device: anObject [
	device := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/7/2024 18:03'
}
SPOCPlaybackState >> isPlaying [
	^ isPlaying
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/7/2024 18:03'
}
SPOCPlaybackState >> isPlaying: anObject [
	isPlaying := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/7/2024 18:03'
}
SPOCPlaybackState >> progressMS [
	^ progressMS
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/7/2024 18:03'
}
SPOCPlaybackState >> progressMS: anObject [
	progressMS := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/7/2024 18:30'
}
SPOCPlaybackState >> track [
	^ track
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/7/2024 18:30'
}
SPOCPlaybackState >> track: anObject [
	track := anObject
]
