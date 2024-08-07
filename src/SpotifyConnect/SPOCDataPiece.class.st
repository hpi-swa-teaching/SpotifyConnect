"
I am a superclass holding all pieces of data that Spotify Connect encounters.
"
Class {
	#name : #SPOCDataPiece,
	#superclass : #Object,
	#instVars : [
		'hasTertiaryText',
		'id',
		'image',
		'name'
	],
	#category : #SpotifyConnect,
	#'squeak_changestamp' : 'OW 7/4/2024 12:29'
}

{
	#category : #formatting,
	#'squeak_changestamp' : 'TL 7/8/2024 20:12'
}
SPOCDataPiece >> artistsAsString [

	| result |
	result := ''.
	self artists
		allButLastDo: [:anArtist | result := result, anArtist name, ', '].
	result := result, self artists last name.
	^ result
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 7/11/2024 19:40'
}
SPOCDataPiece >> artistsEqual: anArtistCollection [

	^ (self artists
		allSatisfy: [:anArtist | ((anArtistCollection at: (self artists indexOf: anArtist)) equals: anArtist)])
]

{
	#category : #testing,
	#'squeak_changestamp' : 'VK 5/27/2024 16:01'
}
SPOCDataPiece >> equals: aDataModel [

	^ self subclassResponsibility
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 7/7/2024 13:07'
}
SPOCDataPiece >> hasTertiaryText [

	^ hasTertiaryText
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 7/7/2024 13:05'
}
SPOCDataPiece >> hasTertiaryText: aBoolean [

	hasTertiaryText := aBoolean
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:14'
}
SPOCDataPiece >> id [

	^ id
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:14'
}
SPOCDataPiece >> id: aString [

	id := aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:14'
}
SPOCDataPiece >> image [

	^ image
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:51'
}
SPOCDataPiece >> image: aSPOCImage [

	image := aSPOCImage
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:52'
}
SPOCDataPiece >> name [

	^ name
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:52'
}
SPOCDataPiece >> name: aString [

	name := aString
]

{
	#category : #'event-handling',
	#'squeak_changestamp' : 'RK 6/16/2024 12:10'
}
SPOCDataPiece >> onClick: anApp [

	^ self subclassResponsibility
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 7/7/2024 12:33'
}
SPOCDataPiece >> primaryText [

	^ self name
]
