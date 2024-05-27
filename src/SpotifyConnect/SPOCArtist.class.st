Class {
	#name : #SPOCArtist,
	#superclass : #SPOCDataModels,
	#instVars : [
		'followers',
		'genres',
		'href',
		'image',
		'popularity'
	],
	#category : #SpotifyConnect
}

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
	#'squeak_changestamp' : 'RK 5/15/2024 16:18'
}
SPOCArtist >> followers [
	^ followers
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 16:19'
}
SPOCArtist >> followers: aNumber [
	followers := aNumber
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 16:18'
}
SPOCArtist >> genres [
	^ genres
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 16:19'
}
SPOCArtist >> genres: aSet [
	genres := aSet
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 16:18'
}
SPOCArtist >> href [
	^ href
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 16:19'
}
SPOCArtist >> href: aString [
	href := aString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 16:18'
}
SPOCArtist >> image [
	^ image
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 16:20'
}
SPOCArtist >> image: anImage [
	image := anImage
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 16:18'
}
SPOCArtist >> popularity [
	^ popularity
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 16:20'
}
SPOCArtist >> popularity: aNumber [
	popularity := aNumber
]
