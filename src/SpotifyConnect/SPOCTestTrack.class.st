Class {
	#name : #SPOCTestTrack,
	#superclass : #TestCase,
	#instVars : [
		'track'
	],
	#category : #'SpotifyConnect-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 5/13/2024 17:25'
}
SPOCTestTrack >> setUp [
	super setUp.
	track := SPOCTrack new 
		id: '123'; 
		name: 'MEGA'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/14/2024 11:37'
}
SPOCTestTrack >> testInstanceVariables [
	self assert: track id = '123'.
	self assert: track name = 'MEGA'.
]
