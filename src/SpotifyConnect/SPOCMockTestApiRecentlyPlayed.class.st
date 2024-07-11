"
Test the API request of recently played songs with mock data.
"
Class {
	#name : #SPOCMockTestApiRecentlyPlayed,
	#superclass : #TestCase,
	#instVars : [
		'apiEndpoint',
		'track'
	],
	#category : #'SpotifyConnect-Mock-Tests',
	#'squeak_changestamp' : 'OW 7/4/2024 12:24'
}

{
	#category : #running,
	#'squeak_changestamp' : 'RK 7/7/2024 13:12'
}
SPOCMockTestApiRecentlyPlayed >> album [

	^ SPOCAlbum new
		id: '4FqEHLgdiMHXboXIztMkkO';
		name: 'How Have You Been?';
		image: (SPOCImage newWithUrl: 'https://i.scdn.co/image/ab67616d0000b27384559fa763af6fb17d9f9683');
		artists: self artists;
		totalTracks: 14;
		hasTertiaryText: false;
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
	#category : #running,
	#'squeak_changestamp' : 'TL 6/12/2024 01:58'
}
SPOCMockTestApiRecentlyPlayed >> artists [

	^ {(SPOCArtist new
			id: '5wD0owYApRtYmjPWavWKvb';
			name: 'Giant Rooks';
			yourself)} asOrderedCollection
]

{
	#category : #running,
	#'squeak_changestamp' : 'RK 7/7/2024 13:12'
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
			hasTertiaryText: true;
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
