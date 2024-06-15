Class {
	#name : #SPOCPlaylist,
	#superclass : #SPOCDataPiece,
	#instVars : [
		'owner'
	],
	#category : #SpotifyConnect
}

{
	#category : #actions,
	#'squeak_changestamp' : 'RK 6/15/2024 18:14'
}
SPOCPlaylist >> clickAction [

	^ ["To do: show playlist page"]
]

{
	#category : #testing,
	#'squeak_changestamp' : 'RK 6/15/2024 18:15'
}
SPOCPlaylist >> equals: aPlaylist [

	^ (self id = aPlaylist id) 
		& (self name = aPlaylist name)

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/15/2024 18:20'
}
SPOCPlaylist >> owner [

	^ owner
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/15/2024 18:21'
}
SPOCPlaylist >> owner: aString [

	owner := aString
]
