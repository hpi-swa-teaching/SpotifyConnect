Class {
	#name : #SPOCUIComponent,
	#superclass : #Morph,
	#instVars : [
		'app'
	],
	#category : #SpotifyConnect
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
	#category : #accessing,
	#'squeak_changestamp' : 'RK 6/7/2024 11:00'
}
SPOCUIComponent >> extendFully [

	self extent: 0@0.
	self extent: self fullBounds extent
]

{
	#category : #'api-connection',
	#'squeak_changestamp' : 'TL 6/10/2024 02:46'
}
SPOCUIComponent >> getPlaybackState [

	| apiEndpoint paramDict |
	paramDict := Dictionary new
		at: #additional_types put: 'track';
		yourself.
	apiEndpoint := SPOCApiPlaybackState new
		authorizer: self app auth;
		yourself.
	^ apiEndpoint execute: paramDict
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'RK 6/7/2024 11:00'
}
SPOCUIComponent >> initialize [

	super initialize.
]
