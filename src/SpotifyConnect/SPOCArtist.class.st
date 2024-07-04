"
I represent an artist
"
Class {
	#name : #SPOCArtist,
	#superclass : #SPOCDataPiece,
	#category : #SpotifyConnect,
	#'squeak_changestamp' : 'OW 7/4/2024 11:53'
}

{
	#category : #actions,
	#'squeak_changestamp' : 'RK 6/7/2024 11:19'
}
SPOCArtist >> clickAction [

	^ ["To do: show artist page"]
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/12/2024 01:10'
}
SPOCArtist >> equals: anArtist [

	^ (self id = anArtist id) 
		& (self name = anArtist name)

]
