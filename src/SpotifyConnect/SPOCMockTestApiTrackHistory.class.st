Class {
	#name : #SPOCMockTestApiTrackHistory,
	#superclass : #TestCase,
	#instVars : [
		'apiEndpoint',
		'track'
	],
	#category : #'SpotifyConnect-Mock-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 05:01'
}
SPOCMockTestApiTrackHistory >> apiEndpoint [

	^ apiEndpoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 05:01'
}
SPOCMockTestApiTrackHistory >> apiEndpoint: anObject [

	apiEndpoint := anObject
]

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/10/2024 05:19'
}
SPOCMockTestApiTrackHistory >> setUp [

	self apiEndpoint: SPOCApiSearch new;
		track: (SPOCTrack new
			id: '45c4L5n0wh6KRv0SOf879S';
			name: 'Morning Blue';
			image: nil;
			artists: nil;
			album: nil;
			duration: 217;
			explicit: false;
			popularity: 59;
			trackNumber: 11;
			yourself).
	self apiEndpoint returnsTestContent: true
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/10/2024 05:00'
}
SPOCMockTestApiTrackHistory >> testMockApiTrackHistoryExecute [

	| dict res resTrack |
	dict := Dictionary new.
	res := self apiEndpoint execute: dict.
	resTrack := res first
		image: nil;
		artists: nil;
		album: nil.
	self assert: (self track equals: resTrack)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 05:01'
}
SPOCMockTestApiTrackHistory >> track [

	^ track
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 05:01'
}
SPOCMockTestApiTrackHistory >> track: anObject [

	track := anObject
]
