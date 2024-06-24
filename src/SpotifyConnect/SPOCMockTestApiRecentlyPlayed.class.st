Class {
	#name : #SPOCMockTestApiRecentlyPlayed,
	#superclass : #TestCase,
	#instVars : [
		'apiEndpoint',
		'track'
	],
	#category : #'SpotifyConnect-Mock-Tests'
}

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/12/2024 01:56'
}
SPOCMockTestApiRecentlyPlayed >> album [

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
	#'squeak_changestamp' : 'TL 6/12/2024 01:46'
}
SPOCMockTestApiRecentlyPlayed >> apiEndpoint [

	^ apiEndpoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/12/2024 01:46'
}
SPOCMockTestApiRecentlyPlayed >> apiEndpoint: anObject [

	apiEndpoint := anObject
]

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/12/2024 01:58'
}
SPOCMockTestApiRecentlyPlayed >> artists [

	^ {(SPOCArtist new
			id: '5wD0owYApRtYmjPWavWKvb';
			name: 'Giant Rooks';
			yourself)} asOrderedCollection
]

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/24/2024 02:48'
}
SPOCMockTestApiRecentlyPlayed >> setUp [

	self apiEndpoint: (SPOCApiRecentlyPlayed new returnsTestContent: true);
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
	#'squeak_changestamp' : 'TL 6/24/2024 03:04'
}
SPOCMockTestApiRecentlyPlayed >> testMockApiRecentlyPlayedExecute [

	| res |
	res := self apiEndpoint getRecentlyPlayed.
	self assert: (res first equals: self track)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/12/2024 01:46'
}
SPOCMockTestApiRecentlyPlayed >> track [

	^ track
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/12/2024 01:46'
}
SPOCMockTestApiRecentlyPlayed >> track: anObject [

	track := anObject
]
