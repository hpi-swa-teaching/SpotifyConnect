Class {
	#name : #SPOCDataPiece,
	#superclass : #Object,
	#instVars : [
		'id',
		'clickAction',
		'image',
		'name'
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
	#category : #actions,
	#'squeak_changestamp' : 'RK 6/7/2024 11:17'
}
SPOCDataPiece >> clickAction [

	^ self subclassResponsibility
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
