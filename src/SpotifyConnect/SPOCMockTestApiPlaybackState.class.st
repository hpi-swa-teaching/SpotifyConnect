Class {
	#name : #SPOCMockTestApiPlaybackState,
	#superclass : #TestCase,
	#instVars : [
		'apiEndpoint',
		'track'
	],
	#category : #'SpotifyConnect-Mock-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 00:25'
}
SPOCMockTestApiPlaybackState >> apiEndpoint [

	^ apiEndpoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 00:25'
}
SPOCMockTestApiPlaybackState >> apiEndpoint: anObject [

	apiEndpoint := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TL 6/10/2024 00:21'
}
SPOCMockTestApiPlaybackState >> setUp [

	self apiEndpoint: SPOCApiPlaybackState new;
		track: (SPOCTrack new
			id: '48lxT5qJF0yYyf2z4wB4xW';
			name: 'Pedro';
			image: nil;
			artists: nil;
			album: nil;
			duration: 144;
			explicit: false;
			popularity: 86;
			trackNumber: 1;
			yourself).
	self apiEndpoint returnsTestContent: true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TL 6/10/2024 00:24'
}
SPOCMockTestApiPlaybackState >> testMockApiPlaybackExecute [

	| paramDict res resTrack |
    	paramDict := Dictionary new
		at: #additional_types put: 'track';
		yourself.
    	res := self apiEndpoint execute: paramDict.
	resTrack := res track
		image: nil;
		artists: nil;
		album: nil.
	self assert: (self track equals: resTrack)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 00:24'
}
SPOCMockTestApiPlaybackState >> track [

	^ track
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 00:25'
}
SPOCMockTestApiPlaybackState >> track: anObject [

	track := anObject
]
