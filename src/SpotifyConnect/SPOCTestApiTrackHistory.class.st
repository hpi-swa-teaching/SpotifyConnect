Class {
	#name : #SPOCTestApiTrackHistory,
	#superclass : #SPOCTestApiEndpoint,
	#instVars : [
		'track'
	],
	#category : #'SpotifyConnect-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 5/28/2024 17:29'
}
SPOCTestApiTrackHistory >> setUp [
	apiEndpoint := SPOCApiTrackHistory new.
	track := SPOCTrack new.
	track id: '45c4L5n0wh6KRv0SOf879S'.
	track name: 'Morning Blue'.
	track album: nil.
	track duration: 217.
	track explicit: false.
	track popularity: 59.
	track trackNumber: 11.
	apiEndpoint returnsTestContent: true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 5/28/2024 17:29'
}
SPOCTestApiTrackHistory >> testExecute [
	| dict res resTrack |
	dict := Dictionary new.
	res := apiEndpoint execute: dict.
	resTrack := res first.
	resTrack album: nil.
	self assert: (track equals: resTrack)
]