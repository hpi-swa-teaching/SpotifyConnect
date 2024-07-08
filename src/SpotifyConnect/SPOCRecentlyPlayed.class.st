"
concrete class for the song history list
"
Class {
	#name : #SPOCRecentlyPlayed,
	#superclass : #SPOCUIComponent,
	#instVars : [
		'tracks',
		'trackItems'
	],
	#category : #'SpotifyConnect-UI',
	#'squeak_changestamp' : 'OW 7/4/2024 12:12'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 6/9/2024 13:53'
}
SPOCRecentlyPlayed class >> beforeTimestamp [

	^ DateAndTime current asUnixTime * 1000
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 6/19/2024 16:32'
}
SPOCRecentlyPlayed class >> recentlyPlayedIconPath [

	^ '/assets/recently-played.png'
]

{
	#category : #building,
	#'squeak_changestamp' : 'TL 7/8/2024 19:39'
}
SPOCRecentlyPlayed >> attachButton [

	| text |
	text := SPOCBoxedTextWithIcon newWithText: 'Recently Played' withIcon: self class recentlyPlayedIconPath.
	self addMorph: (SPOCClickable newUsing: text onClick: [:anEvent | self getRecentlyPlayed])
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'VE 7/2/2024 18:56'
}
SPOCRecentlyPlayed >> getRecentlyPlayed [

	| apiEndpoint |
	self isDisabled ifTrue: [self showPopUp. ^ self].
	apiEndpoint := SPOCApiRecentlyPlayed new
		authorizer: self app auth;
		yourself.
	self results: (apiEndpoint getRecentlyPlayed).
	self app resultList updateResults: self results;
		title: 'Recently Played'
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'TL 7/8/2024 19:39'
}
SPOCRecentlyPlayed >> initialize [

	super initialize.
	
	self color: Color transparent;
		items: OrderedCollection new;
		results: OrderedCollection new;
		attachButton;
		extendFully
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 7/8/2024 19:16'
}
SPOCRecentlyPlayed >> items [

	^ trackItems
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 7/8/2024 19:16'
}
SPOCRecentlyPlayed >> items: anObject [

	trackItems := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 7/8/2024 19:16'
}
SPOCRecentlyPlayed >> results [

	^ tracks
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 7/8/2024 19:16'
}
SPOCRecentlyPlayed >> results: anObject [

	tracks := anObject
]
