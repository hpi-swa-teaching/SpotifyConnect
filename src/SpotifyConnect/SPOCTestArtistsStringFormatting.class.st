Class {
	#name : #SPOCTestArtistsStringFormatting,
	#superclass : #TestCase,
	#instVars : [
		'album',
		'artistsString'
	],
	#category : #'SpotifyConnect-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/23/2024 14:59'
}
SPOCTestArtistsStringFormatting >> album [

	^ album
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/23/2024 15:00'
}
SPOCTestArtistsStringFormatting >> album: anObject [

	album := anObject
]

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/23/2024 14:51'
}
SPOCTestArtistsStringFormatting >> artists [
	
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
	#'squeak_changestamp' : 'TL 6/23/2024 14:45'
}
SPOCTestArtistsStringFormatting >> artistsString [

	^ artistsString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/23/2024 14:45'
}
SPOCTestArtistsStringFormatting >> artistsString: anObject [

	artistsString := anObject
]

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/23/2024 14:59'
}
SPOCTestArtistsStringFormatting >> setUp [

	self artistsString: 'Jaxomy, Agatino Romero, Raffaella Carrà';
		setUpAlbum
]

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/23/2024 14:59'
}
SPOCTestArtistsStringFormatting >> setUpAlbum [

	self album: (SPOCAlbum new
			id: '5y6RXjI5VPR0RyInghTbf1';
			name: 'Pedro';
			image: (SPOCImage newWithUrl: 'https://i.scdn.co/image/ab67616d0000b27384464d902b1ebaf62775a6da');
			artists: self artists;
			totalTracks: 1;
			yourself)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/23/2024 15:11'
}
SPOCTestArtistsStringFormatting >> testArtistsAsString [

	self assert: (self album artistsAsString = self artistsString)
]
