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
	#'squeak_changestamp' : 'VK 6/9/2024 12:32'
}
SPOCMockTestApiRecentlyPlayed >> setUp [
	apiEndpoint := SPOCApiRecentlyPlayed new.
	track := SPOCTrack new.
	track id: '45c4L5n0wh6KRv0SOf879S';
		name: 'Morning Blue';
		album: nil;
		duration: 217;
		explicit: false;
		popularity: 59;
		trackNumber: 11.
	apiEndpoint returnsTestContent: true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 6/5/2024 19:39'
}
SPOCMockTestApiRecentlyPlayed >> testMockApiTrackHistoryExecute [

	| dict res resTrack |
	dict := Dictionary new.
	res := apiEndpoint execute: dict.
	resTrack := res first.
	resTrack album: nil.
	self assert: (track equals: resTrack)
]
