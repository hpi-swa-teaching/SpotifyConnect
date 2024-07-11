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
	#category : #running,
	#'squeak_changestamp' : 'TL 7/7/2024 17:16'
}
SPOCMockTestApiPlaylist >> album [

	^ SPOCAlbum new
		id: '1NAmidJlEaVgA3MpcPFYGq';
		name: 'Lover';
		image: (SPOCImage newWithUrl: 'https://i.scdn.co/image/ab67616d0000b273e787cffec20aa2a396a61647');
		artists: self artists;
		totalTracks: 18;
		hasTertiaryText: false;
		yourself
]

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
	#category : #running,
	#'squeak_changestamp' : 'TL 6/24/2024 04:47'
}
SPOCMockTestApiPlaylist >> artists [
	
	^ {(SPOCArtist new
			id: '06HL4z0CvFAxyc27GXpf02';
			name: 'Taylor Swift';
			yourself)} asOrderedCollection
]

{
	#category : #running,
	#'squeak_changestamp' : 'TL 7/7/2024 17:16'
}
SPOCMockTestApiPlaylist >> setUp [

	self apiEndpoint: (SPOCApiPlaylist new returnsTestContent: true);
		track: (SPOCTrack new
			id: '214nt20w5wOxJnY462klLw';
			name: 'Miss Americana & The Heartbreak Prince';
			image: (SPOCImage newWithUrl: 'https://i.scdn.co/image/ab67616d0000b273e787cffec20aa2a396a61647');
			album: self album;
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
