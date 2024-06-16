Class {
	#name : #SPOCDataPiece,
	#superclass : #Object,
	#instVars : [
		'id',
		'image',
		'name',
		'offset'
	],
	#category : #SpotifyConnect
}

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/12/2024 01:29'
}
SPOCDataPiece >> artistsEqual: anArtistCollection [

	self artists collect: [:anArtist | 
		((anArtistCollection at: (self artists indexOf: anArtist)) equals: anArtist)
			ifFalse: [^ false]].
	^ true
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
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/16/2024 14:31'
}
SPOCDataPiece >> offset [

	"Offset within a search result, album or playlist"
	^ offset
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/16/2024 13:59'
}
SPOCDataPiece >> offset: aNumber [

	offset := aNumber
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'RK 6/16/2024 12:10'
}
SPOCDataPiece >> onClick: anApp [

	^ self subclassResponsibility
]
