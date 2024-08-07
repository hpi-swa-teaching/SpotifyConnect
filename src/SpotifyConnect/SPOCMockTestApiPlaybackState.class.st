"
Test the API request of the current playback state with mock data.
"
Class {
	#name : #SPOCMockTestApiPlaybackState,
	#superclass : #TestCase,
	#instVars : [
		'album',
		'apiEndpoint',
		'artists',
		'device',
		'playbackState',
		'track'
	],
	#category : #'SpotifyConnect-Mock-Tests',
	#'squeak_changestamp' : 'OW 7/4/2024 12:24'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/12/2024 01:43'
}
SPOCMockTestApiPlaybackState >> album [

	^ album
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/12/2024 01:43'
}
SPOCMockTestApiPlaybackState >> album: anObject [

	album := anObject
]

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
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/12/2024 01:43'
}
SPOCMockTestApiPlaybackState >> artists [

	^ artists
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/12/2024 01:43'
}
SPOCMockTestApiPlaybackState >> artists: anObject [

	artists := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/12/2024 01:43'
}
SPOCMockTestApiPlaybackState >> device [

	^ device
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/12/2024 01:43'
}
SPOCMockTestApiPlaybackState >> device: anObject [

	device := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/12/2024 01:43'
}
SPOCMockTestApiPlaybackState >> playbackState [

	^ playbackState
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/12/2024 01:44'
}
SPOCMockTestApiPlaybackState >> playbackState: anObject [

	playbackState := anObject
]

{
	#category : #running,
	#'squeak_changestamp' : 'TL 6/24/2024 04:26'
}
SPOCMockTestApiPlaybackState >> setUp [

	self apiEndpoint: (SPOCApiPlaybackState new returnsTestContent: true);
		setUpDevice;
		setUpArtist;
		setUpAlbum;
		setUpTrack;
		setUpPlaybackState
]

{
	#category : #running,
	#'squeak_changestamp' : 'RK 7/7/2024 13:11'
}
SPOCMockTestApiPlaybackState >> setUpAlbum [

	self album: (SPOCAlbum new
			id: '5y6RXjI5VPR0RyInghTbf1';
			name: 'Pedro';
			image: (SPOCImage newWithUrl: 'https://i.scdn.co/image/ab67616d0000b27384464d902b1ebaf62775a6da');
			artists: self artists;
			totalTracks: 1;
			hasTertiaryText: false;
			yourself)
]

{
	#category : #running,
	#'squeak_changestamp' : 'TL 6/24/2024 04:26'
}
SPOCMockTestApiPlaybackState >> setUpArtist [

	self artists: {(SPOCArtist new
			id: '1c3uso4iIeeX3P0bhKaQDq';
			name: 'Jaxomy';
			yourself).
		(SPOCArtist new
			id: '124jbwgd8Hh6LW7jAqTa8r';
			name: 'Agatino Romero';
			yourself).
		(SPOCArtist new
			id: '6EVyI0S0b1Ld2nm37m5x85';
			name: 'Raffaella Carrà';
			yourself)} asOrderedCollection
]

{
	#category : #running,
	#'squeak_changestamp' : 'TL 6/12/2024 01:39'
}
SPOCMockTestApiPlaybackState >> setUpDevice [

	self device: (SPOCDevice new
			id: 'b704b454bce64526992a3f207723032f5f91e635';
			isActive: true;
			name: 'TL-04';
			supportsVolume: true;
			type: 'Computer';
			volume: 100;
			yourself)
]

{
	#category : #running,
	#'squeak_changestamp' : 'TL 6/12/2024 01:39'
}
SPOCMockTestApiPlaybackState >> setUpPlaybackState [

	self playbackState: (SPOCPlaybackState new
			device: self device;
			isPlaying: true;
			progress: 66236;
			track: self track;
			yourself)
]

{
	#category : #running,
	#'squeak_changestamp' : 'RK 7/7/2024 13:11'
}
SPOCMockTestApiPlaybackState >> setUpTrack [

	self track: (SPOCTrack new
			id: '48lxT5qJF0yYyf2z4wB4xW';
			name: 'Pedro';
			image: (SPOCImage newWithUrl: 'https://i.scdn.co/image/ab67616d0000b27384464d902b1ebaf62775a6da');
			album: self album;
			artists: self artists;
			duration: 144;
			trackNumber: 1;
			hasTertiaryText: true;
			yourself)
	
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/24/2024 03:06'
}
SPOCMockTestApiPlaybackState >> testMockApiPlaybackExecute [

	| res |
    	res := self apiEndpoint getPlaybackState.
	self assert: (res equals: self playbackState)
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
