Class {
	#name : #SPOCMockTestApiAlbum,
	#superclass : #TestCase,
	#instVars : [
		'apiEndpoint',
		'track'
	],
	#category : #'SpotifyConnect-Mock-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/23/2024 15:50'
}
SPOCMockTestApiAlbum >> apiEndpoint [

	^ apiEndpoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/23/2024 15:50'
}
SPOCMockTestApiAlbum >> apiEndpoint: anObject [

	apiEndpoint := anObject
]

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/23/2024 16:16'
}
SPOCMockTestApiAlbum >> artists [

	^ {(SPOCArtist new
			id: '06HL4z0CvFAxyc27GXpf02';
			name: 'Taylor Swift';
			yourself)} asOrderedCollection
]

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/23/2024 16:22'
}
SPOCMockTestApiAlbum >> setUp [

	self apiEndpoint: (SPOCApiAlbum new returnsTestContent: true);
		track: (SPOCTrack new
			id: '2yLa0QULdQr0qAIvVwN6B5';
			name: '...Ready For It?';
			image: nil;
			album: nil;
			artists: self artists;
			duration: 208;
			trackNumber: 1;
			yourself).
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/23/2024 16:27'
}
SPOCMockTestApiAlbum >> testMockApiAlbumExecute [

	| res |
	res := self apiEndpoint execute: (Dictionary new).
	res first image: nil;
		album: nil.
	self assert: (res first equals: self track)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/23/2024 16:03'
}
SPOCMockTestApiAlbum >> track [

	^ track
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/23/2024 16:03'
}
SPOCMockTestApiAlbum >> track: anObject [

	track := anObject
]
