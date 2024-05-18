Class {
	#name : #SPOCArtist,
	#superclass : #SPOCData,
	#instVars : [
		'id',
		'name',
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
SPOCArtist >> id [
	^ id
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 16:20'
}
SPOCArtist >> id: aString [
	id := aString
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
SPOCArtist >> name [
	^ name
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 5/15/2024 16:20'
}
SPOCArtist >> name: aString [
	name := aString
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
