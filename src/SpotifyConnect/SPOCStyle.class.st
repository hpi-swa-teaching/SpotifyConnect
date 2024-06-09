Class {
	#name : #SPOCStyle,
	#superclass : #Morph,
	#category : #'SpotifyConnect-Utils'
}

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 6/7/2024 23:46'
}
SPOCStyle class >> currentlyPlayingWidth [

	^ 400
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 6/7/2024 11:10'
}
SPOCStyle class >> defaultMargin [

	^ 10
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 6/8/2024 23:35'
}
SPOCStyle class >> gitRepoName [

	^ 'SpotifyConnect'
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 6/9/2024 14:44'
}
SPOCStyle class >> recentlyPlayedPadding [

	^ 8
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 6/7/2024 11:10'
}
SPOCStyle class >> resultListHeight [

	^ 550
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 6/7/2024 11:10'
}
SPOCStyle class >> resultListItemHeight [

	^ 96
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 6/7/2024 11:10'
}
SPOCStyle class >> resultListItemPadding [

	^ 95
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 6/7/2024 11:10'
}
SPOCStyle class >> resultListLimit [

	^ 20
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 6/7/2024 11:11'
}
SPOCStyle class >> resultListWidth [

	^ 1150
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 6/7/2024 11:11'
}
SPOCStyle class >> searchbarHeight [

	^ 32
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 6/7/2024 11:11'
}
SPOCStyle class >> searchbarWidth [

	^ 600
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 6/7/2024 11:11'
}
SPOCStyle class >> spotifyBlack [

	^ Color r: 25/255 g: 20/255 b: 20/255
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 6/7/2024 11:11'
}
SPOCStyle class >> spotifyGray [

	^ Color r: 36/255 g: 36/255 b: 36/255
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 6/7/2024 11:11'
}
SPOCStyle class >> spotifyGreen [

	^ Color r: 30/255 g: 215/255 b: 96/255
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 6/7/2024 11:11'
}
SPOCStyle class >> spotifyWhite [

	^ Color r: 255/255 g: 255/255 b: 255/255
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 6/7/2024 11:11'
}
SPOCStyle class >> textHeight [

	^ 30
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'RK 6/9/2024 00:23'
}
SPOCStyle class >> trackWelcome [

	| collection |
	collection := OrderedCollection new.
	collection add: (SPOCArtist new name: 'Spotify in Squeak').
	^(SPOCTrack new
		image: (SPOCImage newWithPath: '/assets/squeak-mouse.png');
		name: 'Welcome!';
		album: (SPOCAlbum new artists: collection);
		duration: 0;
		yourself)
]
