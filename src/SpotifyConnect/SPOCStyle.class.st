Class {
	#name : #SPOCStyle,
	#superclass : #Object,
	#category : #'SpotifyConnect-UI'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'RK 6/10/2024 14:32'
}
SPOCStyle class >> currentlyPlayingWidth [

	^ 600
]

{
	#category : #constants,
	#'squeak_changestamp' : 'RK 6/7/2024 11:10'
}
SPOCStyle class >> defaultMargin [

	^ 10
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'VK 6/10/2024 11:43'
}
SPOCStyle class >> devicesPanelHeight [

	^ 200
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'VK 6/10/2024 16:48'
}
SPOCStyle class >> devicesPanelLayer [

	^ 1
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'VK 6/10/2024 11:46'
}
SPOCStyle class >> devicesPanelPadding [

	^ 35
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'VK 6/10/2024 11:39'
}
SPOCStyle class >> devicesPanelToItemRatio [

	^ 0.4
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'VK 6/10/2024 11:30'
}
SPOCStyle class >> devicesPanelWidth [

	^ 300
]

{
	#category : #'class variables',
	#'squeak_changestamp' : 'VK 6/10/2024 11:55'
}
SPOCStyle class >> devicesTextPadding [

	^ 8
]

{
	#category : #constants,
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
	#category : #constants,
	#'squeak_changestamp' : 'VE 6/10/2024 14:47'
}
SPOCStyle class >> resultListHeight [

	^ 350
]

{
	#category : #constants,
	#'squeak_changestamp' : 'RK 6/7/2024 11:10'
}
SPOCStyle class >> resultListItemHeight [

	^ 96
]

{
	#category : #constants,
	#'squeak_changestamp' : 'RK 6/7/2024 11:10'
}
SPOCStyle class >> resultListItemPadding [

	^ 95
]

{
	#category : #constants,
	#'squeak_changestamp' : 'VE 6/10/2024 14:20'
}
SPOCStyle class >> resultListLimit [

	^ 10
]

{
	#category : #constants,
	#'squeak_changestamp' : 'VE 6/10/2024 14:45'
}
SPOCStyle class >> resultListWidth [

	^ 1048
]

{
	#category : #constants,
	#'squeak_changestamp' : 'RK 6/7/2024 11:11'
}
SPOCStyle class >> searchbarHeight [

	^ 32
]

{
	#category : #constants,
	#'squeak_changestamp' : 'RK 6/7/2024 11:11'
}
SPOCStyle class >> searchbarWidth [

	^ 600
]

{
	#category : #colors,
	#'squeak_changestamp' : 'RK 6/7/2024 11:11'
}
SPOCStyle class >> spotifyBlack [

	^ Color r: 25/255 g: 20/255 b: 20/255
]

{
	#category : #colors,
	#'squeak_changestamp' : 'RK 6/7/2024 11:11'
}
SPOCStyle class >> spotifyGray [

	^ Color r: 36/255 g: 36/255 b: 36/255
]

{
	#category : #colors,
	#'squeak_changestamp' : 'RK 6/7/2024 11:11'
}
SPOCStyle class >> spotifyGreen [

	^ Color r: 30/255 g: 215/255 b: 96/255
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
	#'squeak_changestamp' : 'RK 6/7/2024 11:11'
}
SPOCStyle class >> textHeight [

	^ 30
]

{
	#category : #constants,
	#'squeak_changestamp' : 'RK 6/16/2024 12:37'
}
SPOCStyle class >> trackWelcome [

	| collection |
	collection := OrderedCollection new.
	collection add: (SPOCArtist new name: 'Spotify in Squeak').
	^ SPOCTrack new
		image: (SPOCImage newWithPath: '/assets/squeak-mouse.png');
		name: 'Welcome!';
		artists: collection;
		duration: 0;
		yourself
]
