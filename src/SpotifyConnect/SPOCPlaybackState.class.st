Class {
	#name : #SPOCPlaybackState,
	#superclass : #Object,
	#instVars : [
		'device',
		'isPlaying',
		'progress',
		'track'
	],
	#category : #SpotifyConnect
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:09'
}
SPOCPlaybackState >> device [

	^ device
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:09'
}
SPOCPlaybackState >> device: anObject [

	device := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:09'
}
SPOCPlaybackState >> isPlaying [

	^ isPlaying
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:09'
}
SPOCPlaybackState >> isPlaying: anObject [

	isPlaying := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 21:25'
}
SPOCPlaybackState >> progress [

	^ progress
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 21:25'
}
SPOCPlaybackState >> progress: anObject [

	progress := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:09'
}
SPOCPlaybackState >> track [

	^ track
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:09'
}
SPOCPlaybackState >> track: anObject [

	track := anObject
]
