"
Test the API request of a playlist with mock data.
"
Class {
	#name : #SPOCMockTestApiPlaylist,
	#superclass : #TestCase,
	#instVars : [
		'apiEndpoint',
		'track'
	],
	#category : #'SpotifyConnect-Mock-Tests',
	#'squeak_changestamp' : 'OW 7/4/2024 12:24'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/24/2024 04:38'
}
SPOCMockTestApiPlaylist >> apiEndpoint [

	^ apiEndpoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/24/2024 04:38'
}
SPOCMockTestApiPlaylist >> apiEndpoint: anObject [

	apiEndpoint := anObject
]

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/24/2024 04:47'
}
SPOCMockTestApiPlaylist >> artists [
	
	^ {(SPOCArtist new
			id: '06HL4z0CvFAxyc27GXpf02';
			name: 'Taylor Swift';
			yourself)} asOrderedCollection
]

{
	#category : #setup,
	#'squeak_changestamp' : 'RK 7/7/2024 13:12'
}
SPOCMockTestApiPlaylist >> setUp [

	self apiEndpoint: (SPOCApiPlaylist new returnsTestContent: true);
		track: (SPOCTrack new
			id: '214nt20w5wOxJnY462klLw';
			name: 'Miss Americana & The Heartbreak Prince';
			image: (SPOCImage newWithUrl: 'https://i.scdn.co/image/ab67616d0000b273e787cffec20aa2a396a61647');
			album: nil;
			artists: self artists;
			duration: 234;
			trackNumber: 7;
			hasTertiaryText: true;
			yourself).
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/24/2024 04:52'
}
SPOCMockTestApiPlaylist >> testMockApiPlaylistExecute [

	| res |
	res := self apiEndpoint execute: Dictionary new.
	self assert: (res first equals: self track)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/24/2024 04:38'
}
SPOCMockTestApiPlaylist >> track [

	^ track
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/24/2024 04:38'
}
SPOCMockTestApiPlaylist >> track: anObject [

	track := anObject
]
