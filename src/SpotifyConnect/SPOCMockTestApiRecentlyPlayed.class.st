Class {
	#name : #SPOCMockTestApiRecentlyPlayed,
	#superclass : #TestCase,
	#instVars : [
		'track',
		'apiEndpoint'
	],
	#category : #'SpotifyConnect-Mock-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TL 6/11/2024 12:08'
}
SPOCMockTestApiRecentlyPlayed >> setUp [
	apiEndpoint := SPOCApiRecentlyPlayed new.
	track := SPOCTrack new.
	track id: '45c4L5n0wh6KRv0SOf879S';
		name: 'Morning Blue';
		album: nil;
		duration: 217;
		trackNumber: 11.
	apiEndpoint returnsTestContent: true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 6/10/2024 17:27'
}
SPOCMockTestApiRecentlyPlayed >> testMockApiRecentlyPlayedExecute [

	| dict res resTrack |
	dict := Dictionary new.
	res := apiEndpoint execute: dict.
	resTrack := res first.
	resTrack album: nil.
	resTrack image: nil.
	self assert: (track equals: resTrack)
]
