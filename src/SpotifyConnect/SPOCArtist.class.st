Class {
	#name : #SPOCArtist,
	#superclass : #SPOCDataPiece,
	#instVars : [
		'followers',
		'popularity'
	],
	#category : #SpotifyConnect
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
	#'squeak_changestamp' : 'TL 6/11/2024 15:25'
}
SPOCArtist >> equals: anArtist [

	^ (self id = anArtist id) 
		& (self name = anArtist name) 
		& (self image = anArtist image)
 		& (self followers = anArtist followers)
 		& (self popularity = anArtist popularity)

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:55'
}
SPOCArtist >> followers [

	^ followers
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:55'
}
SPOCArtist >> followers: aNumber [

	followers := aNumber
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:55'
}
SPOCArtist >> popularity [

	^ popularity
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:55'
}
SPOCArtist >> popularity: aNumber [

	popularity := aNumber
]
