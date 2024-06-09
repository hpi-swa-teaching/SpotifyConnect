Class {
	#name : #SPOCMockTestApiSearch,
	#superclass : #TestCase,
	#instVars : [
		'apiEndpoint',
		'track'
	],
	#category : #'SpotifyConnect-Mock-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TL 6/10/2024 00:19'
}
SPOCMockTestApiSearch >> setUp [

	apiEndpoint := SPOCApiSearch new.
	track := SPOCTrack new.
	track id: '45c4L5n0wh6KRv0SOf879S';
		name: 'Morning Blue';
		image: nil;
		artists: nil;
		album: nil;
		duration: 217;
		explicit: false;
		popularity: 59;
		trackNumber: 11.
	apiEndpoint returnsTestContent: true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TL 6/10/2024 00:25'
}
SPOCMockTestApiSearch >> testMockApiSearchExecute [

	| dict res resTrack |
	dict := Dictionary new.
	res := apiEndpoint execute: dict.
	resTrack := res first
		image: nil;
		artists: nil;
		album: nil.
	self assert: (track equals: resTrack)
]
