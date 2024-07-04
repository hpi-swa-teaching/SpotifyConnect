"
Test the API request of a search with mock data.
"
Class {
	#name : #SPOCMockTestApiSearch,
	#superclass : #TestCase,
	#instVars : [
		'apiEndpoint',
		'track'
	],
	#category : #'SpotifyConnect-Mock-Tests',
	#'squeak_changestamp' : 'OW 7/4/2024 12:25'
}

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/12/2024 02:05'
}
SPOCMockTestApiSearch >> album [

	^ SPOCAlbum new
		id: '4FqEHLgdiMHXboXIztMkkO';
		name: 'How Have You Been?';
		image: (SPOCImage newWithUrl: 'https://i.scdn.co/image/ab67616d0000b27384559fa763af6fb17d9f9683');
		artists: self artists;
		totalTracks: 14;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:58'
}
SPOCMockTestApiSearch >> apiEndpoint [

	^ apiEndpoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:58'
}
SPOCMockTestApiSearch >> apiEndpoint: anObject [

	apiEndpoint := anObject
]

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/12/2024 02:05'
}
SPOCMockTestApiSearch >> artists [

	^ {(SPOCArtist new
			id: '5wD0owYApRtYmjPWavWKvb';
			name: 'Giant Rooks';
			yourself)} asOrderedCollection
]

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/24/2024 02:49'
}
SPOCMockTestApiSearch >> setUp [

	self apiEndpoint: (SPOCApiSearch new returnsTestContent: true);
		track: (SPOCTrack new
			id: '45c4L5n0wh6KRv0SOf879S';
			name: 'Morning Blue';
			image: (SPOCImage newWithUrl: 'https://i.scdn.co/image/ab67616d0000b27384559fa763af6fb17d9f9683');
			album: self album;
			artists: self artists;
			duration: 217;
			trackNumber: 11;
			yourself)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/24/2024 03:05'
}
SPOCMockTestApiSearch >> testMockApiSearchExecute [

	| res |
	res := self apiEndpoint search: 'Morning Blue' withFilter: 'track'.
	self assert: (res first equals: self track)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:58'
}
SPOCMockTestApiSearch >> track [

	^ track
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:58'
}
SPOCMockTestApiSearch >> track: anObject [

	track := anObject
]
