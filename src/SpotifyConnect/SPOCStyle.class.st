"
This class holds values for the style of the app.
"
Class {
	#name : #SPOCStyle,
	#superclass : #Object,
	#category : #'SpotifyConnect-UI',
	#'squeak_changestamp' : 'OW 7/4/2024 12:30'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'RK 6/7/2024 11:10'
}
SPOCStyle class >> defaultMargin [

	^ 10
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 7/8/2024 17:20'
}
SPOCStyle class >> defaultRequestLimit [

	^ 10
]

{
	#category : #constants,
	#'squeak_changestamp' : 'RK 6/8/2024 23:35'
}
SPOCStyle class >> gitRepoName [

	^ 'SpotifyConnect'
]

{
	#category : #colors,
	#'squeak_changestamp' : 'TL 7/8/2024 19:40'
}
SPOCStyle class >> spotifyBlack [

	^ Color r: 25 / 255 g: 20 / 255 b: 20 / 255
]

{
	#category : #colors,
	#'squeak_changestamp' : 'TL 7/8/2024 19:41'
}
SPOCStyle class >> spotifyGray [

	^ Color r: 36 / 255 g: 36 / 255 b: 36 / 255
]

{
	#category : #colors,
	#'squeak_changestamp' : 'TL 7/8/2024 19:41'
}
SPOCStyle class >> spotifyGreen [

	^ Color r: 30 / 255 g: 215 / 255 b: 96 / 255
]

{
	#category : #colors,
	#'squeak_changestamp' : 'VE 6/10/2024 22:22'
}
SPOCStyle class >> spotifyWhite [

	^ Color white
]

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 7/8/2024 19:27'
}
SPOCStyle class >> trackWelcome [

	| collection |
	collection := OrderedCollection new add: (SPOCArtist new name: 'Spotify in Squeak');
		yourself.
	^ SPOCTrack new
		image: (SPOCImage newWithPath: '/assets/squeak-mouse.png');
		name: 'Welcome!';
		artists: collection;
		duration: 0;
		hasTertiaryText: false;
		yourself
]
