Class {
	#name : #SPOCTestTrack,
	#superclass : #TestCase,
	#instVars : [
		'track'
	],
	#category : #'SpotifyConnect-Tests'
}

{
	#category : #setup,
	#'squeak_changestamp' : 'TL 6/10/2024 05:04'
}
SPOCTestTrack >> setUp [

	super setUp.
	
	self track: (SPOCTrack new 
			id: '123'; 
			name: 'MEGA';
			yourself)
]

{
	#category : #testing,
	#'squeak_changestamp' : 'TL 6/10/2024 05:05'
}
SPOCTestTrack >> testInstanceVariables [

	self assert: self track id = '123'.
	self assert: self track name = 'MEGA'
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 05:05'
}
SPOCTestTrack >> track [

	^ track
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 05:05'
}
SPOCTestTrack >> track: anObject [

	track := anObject
]
