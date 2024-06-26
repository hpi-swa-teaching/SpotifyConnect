Class {
	#name : #SPOCPlaylist,
	#superclass : #SPOCDataPiece,
	#instVars : [
		'owner'
	],
	#category : #SpotifyConnect
}

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/24/2024 04:30'
}
SPOCPlaylist >> equals: aPlaylist [

	^ (self id = aPlaylist id) 
		& (self name = aPlaylist name)
		& (self image equals: aPlaylist image)
		& (self owner = aPlaylist owner)

]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'TL 6/24/2024 05:18'
}
SPOCPlaylist >> onClick: anApp [

	| apiEndpoint results |
	apiEndpoint := SPOCApiPlaylist new authorizer: anApp auth.
	results := apiEndpoint getPlaylistWithID: self id.
	anApp searchbar context: self id.
	anApp resultList updateResults: results
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
