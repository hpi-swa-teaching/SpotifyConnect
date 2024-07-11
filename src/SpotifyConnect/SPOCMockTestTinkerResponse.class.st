"
Tests the tinker response method for API requests.
"
Class {
	#name : #SPOCMockTestTinkerResponse,
	#superclass : #TestCase,
	#instVars : [
		'album',
		'apiEndpoint',
		'artist',
		'device',
		'playbackState',
		'track'
	],
	#category : #'SpotifyConnect-Mock-Tests',
	#'squeak_changestamp' : 'TL 7/11/2024 19:31'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 23:50'
}
SPOCMockTestTinkerResponse >> album [

	^ album
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 23:50'
}
SPOCMockTestTinkerResponse >> album: anObject [

	album := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/11/2024 00:08'
}
SPOCMockTestTinkerResponse >> apiEndpoint [

	^ apiEndpoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/11/2024 00:08'
}
SPOCMockTestTinkerResponse >> apiEndpoint: anObject [

	apiEndpoint := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 23:50'
}
SPOCMockTestTinkerResponse >> artist [

	^ artist
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 23:50'
}
SPOCMockTestTinkerResponse >> artist: anObject [

	artist := anObject
]

{
	#category : #running,
	#'squeak_changestamp' : 'TL 6/12/2024 00:38'
}
SPOCMockTestTinkerResponse >> artists [
	
	^ {(SPOCArtist new
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
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 23:50'
}
SPOCMockTestTinkerResponse >> device [

	^ device
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 23:50'
}
SPOCMockTestTinkerResponse >> device: anObject [

	device := anObject
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 7/11/2024 18:18'
}
SPOCMockTestTinkerResponse >> mockJsonPlaybackState [

	^ Json readFrom: (SPOCApiPlaybackState new loadMockdataFromAsset: 'playbackStateResponse')
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 23:50'
}
SPOCMockTestTinkerResponse >> playbackState [

	^ playbackState
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 23:50'
}
SPOCMockTestTinkerResponse >> playbackState: anObject [

	playbackState := anObject
]

{
	#category : #running,
	#'squeak_changestamp' : 'TL 6/24/2024 04:26'
}
SPOCMockTestTinkerResponse >> setUp [

	self apiEndpoint: SPOCApiEndpoint new;
		setUpDevice;
		setUpArtist;
		setUpAlbum;
		setUpTrack;
		setUpPlaybackState
	
]

{
	#category : #running,
	#'squeak_changestamp' : 'RK 7/7/2024 13:13'
}
SPOCMockTestTinkerResponse >> setUpAlbum [

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
SPOCMockTestTinkerResponse >> setUpArtist [

	self artist: (SPOCArtist new
			id: '1c3uso4iIeeX3P0bhKaQDq';
			name: 'Jaxomy';
			yourself)
	
]

{
	#category : #running,
	#'squeak_changestamp' : 'TL 6/11/2024 11:56'
}
SPOCMockTestTinkerResponse >> setUpDevice [

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
	#'squeak_changestamp' : 'TL 6/12/2024 01:29'
}
SPOCMockTestTinkerResponse >> setUpPlaybackState [

	self playbackState: (SPOCPlaybackState new
			device: self device;
			isPlaying: true;
			progress: 66236;
			track: self track;
			yourself)
]

{
	#category : #running,
	#'squeak_changestamp' : 'RK 7/7/2024 13:13'
}
SPOCMockTestTinkerResponse >> setUpTrack [

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
	#'squeak_changestamp' : 'TL 7/11/2024 18:18'
}
SPOCMockTestTinkerResponse >> testTinkerAlbum [

	| res |
	res := self apiEndpoint tinkerAlbum: ((self mockJsonPlaybackState at: #item) at: #album).
	self assert: (res equals: self album)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 7/11/2024 18:18'
}
SPOCMockTestTinkerResponse >> testTinkerArtist [

	| res |
	res := self apiEndpoint tinkerArtist: (((self mockJsonPlaybackState at: #item) at: #artists) first).
	self assert: (res equals: self artist)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 7/11/2024 18:18'
}
SPOCMockTestTinkerResponse >> testTinkerDevice [

	| res |
	res := self apiEndpoint tinkerDevice: (self mockJsonPlaybackState at: #device).
	self assert: (res equals: self device)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 7/11/2024 18:18'
}
SPOCMockTestTinkerResponse >> testTinkerPlaybackState [

	| res |
	res := self apiEndpoint tinkerPlaybackState: self mockJsonPlaybackState.
	self assert: (res equals: self playbackState)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 7/11/2024 18:18'
}
SPOCMockTestTinkerResponse >> testTinkerTrack [

	| res |
	res := self apiEndpoint tinkerTrack: (self mockJsonPlaybackState at: #item).
	self assert: (res equals: self track)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 23:50'
}
SPOCMockTestTinkerResponse >> track [

	^ track
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 23:50'
}
SPOCMockTestTinkerResponse >> track: anObject [

	track := anObject
]
