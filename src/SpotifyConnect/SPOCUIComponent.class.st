Class {
	#name : #SPOCUIComponent,
	#superclass : #Morph,
	#instVars : [
		'app'
	],
	#category : #'SpotifyConnect-UI'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:00'
}
SPOCUIComponent >> app [

	^ app
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:00'
}
SPOCUIComponent >> app: aSPOCApp [

	app := aSPOCApp
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 6/7/2024 11:00'
}
SPOCUIComponent >> extendFully [

	self extent: 0@0.
	self extent: self fullBounds extent
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/10/2024 04:37'
}
SPOCUIComponent >> getPlaybackState [

	| apiEndpoint dict |
	dict := Dictionary new
		at: #additional_types put: 'track';
		yourself.
	apiEndpoint := SPOCApiPlaybackState new
		authorizer: self app auth;
		yourself.
	^ apiEndpoint execute: dict
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'VE 6/10/2024 17:38'
}
SPOCUIComponent >> initialize [

	super initialize.
	self hResizing: #rigid; 
		vResizing: #rigid
]
