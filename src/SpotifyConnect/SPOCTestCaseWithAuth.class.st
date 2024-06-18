Class {
	#name : #SPOCTestCaseWithAuth,
	#superclass : #TestCase,
	#instVars : [
		'apiEndpoint'
	],
	#category : #'SpotifyConnect-Auth-Tests'
}

{
	#category : #resources,
	#'squeak_changestamp' : 'TL 6/10/2024 04:48'
}
SPOCTestCaseWithAuth class >> resources [

	^ {SPOCAuthTestResource}
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:41'
}
SPOCTestCaseWithAuth >> apiEndpoint [

	^ apiEndpoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/10/2024 04:41'
}
SPOCTestCaseWithAuth >> apiEndpoint: anObject [

	apiEndpoint := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'OW 6/5/2024 18:57'
}
SPOCTestCaseWithAuth >> auth [

	^ SPOCTestCaseWithAuth resources first current auth
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 6/18/2024 23:24'
}
SPOCTestCaseWithAuth >> getPlaybackState [

	| apiEndpoint |
	apiEndpoint := SPOCApiPlaybackState new
		authorizer: self auth;
		yourself.
	^ apiEndpoint getPlaybackState
]
