"
I represent a Spotify playlist
"
Class {
	#name : #SPOCPlaylist,
	#superclass : #SPOCDataPiece,
	#instVars : [
		'owner'
	],
	#category : #SpotifyConnect,
	#'squeak_changestamp' : 'OW 7/4/2024 11:53'
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
	#'squeak_changestamp' : 'VE 6/26/2024 17:27'
}
SPOCPlaylist >> onClick: anApp [

	| apiEndpoint results |
	apiEndpoint := SPOCApiPlaylist new authorizer: anApp auth.
	results := apiEndpoint getPlaylistWithID: self id.
	anApp searchbar context: self id.
	anApp resultList updateResults: results;
		title: self name
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

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 7/7/2024 12:34'
}
SPOCPlaylist >> secondaryText [

	^ self owner
]
