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
	#'squeak_changestamp' : 'RK 6/15/2024 18:15'
}
SPOCPlaylist >> equals: aPlaylist [

	^ (self id = aPlaylist id) 
		& (self name = aPlaylist name)

]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'RK 6/16/2024 12:35'
}
SPOCPlaylist >> onClick: anApp [

	| apiEndpoint dict results |
	dict := Dictionary new
		at: #id put: self id;
		yourself.
	apiEndpoint := SPOCApiPlaylist new authorizer: anApp auth.
	results := (apiEndpoint execute: dict).
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
