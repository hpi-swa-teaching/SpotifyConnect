Class {
	#name : #SPOCArtist,
	#superclass : #SPOCDataModel,
	#instVars : [
		'followers',
		'genres',
		'href',
		'popularity'
	],
	#category : #SpotifyConnect
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:19'
}
SPOCArtist >> clickAction [

	^ ["To do: show artist page"]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'VK 5/27/2024 16:28'
}
SPOCArtist >> equals: anArtist [

    ^ (self id = anArtist id) 
        & (self name = anArtist name) 
        & (self followers = anArtist followers)
        & (self genres = anArtist genres)
        & (self href = anArtist href)
        & (self image = anArtist image)
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
SPOCArtist >> genres [

	^ genres
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:55'
}
SPOCArtist >> genres: anOrderedCollection [

	genres := anOrderedCollection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:55'
}
SPOCArtist >> href [

	^ href
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 10:55'
}
SPOCArtist >> href: aString [

	href := aString
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
