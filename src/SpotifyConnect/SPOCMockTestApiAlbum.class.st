"
Test the API request of an album with mock data.
"
Class {
	#name : #SPOCMockTestApiAlbum,
	#superclass : #TestCase,
	#instVars : [
		'apiEndpoint',
		'track'
	],
	#category : #'SpotifyConnect-Mock-Tests',
	#'squeak_changestamp' : 'OW 7/4/2024 12:23'
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
	#'squeak_changestamp' : 'TL 6/23/2024 17:18'
}
SPOCMockTestApiAlbum >> setUp [

	self apiEndpoint: (SPOCApiAlbum new returnsTestContent: true);
		track: (SPOCTrack new
			id: '2yLa0QULdQr0qAIvVwN6B5';
			name: '...Ready For It?';
			image: (SPOCImage newWithPath: '/assets/squeak-mouse.png');
			album: nil;
			artists: self artists;
			duration: 208;
			trackNumber: 1;
			yourself).
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/24/2024 04:39'
}
SPOCMockTestApiAlbum >> testMockApiAlbumExecute [

	| res |
	res := self apiEndpoint execute: Dictionary new.
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
