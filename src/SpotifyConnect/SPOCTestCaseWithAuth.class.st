"
Testcases that use the authorizer ressource.
"
Class {
	#name : #SPOCTestCaseWithAuth,
	#superclass : #TestCase,
	#instVars : [
		'apiEndpoint'
	],
	#category : #'SpotifyConnect-Auth-Tests',
	#'squeak_changestamp' : 'TL 7/11/2024 19:31'
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
	#'squeak_changestamp' : 'TL 7/8/2024 20:12'
}
SPOCTestCaseWithAuth >> auth [

	^ self class resources first current auth
]

{
	#category : #'api-call',
	#'squeak_changestamp' : 'TL 7/8/2024 20:14'
}
SPOCTestCaseWithAuth >> getPlaybackState [

	^ (SPOCApiPlaybackState new authorizer: self auth) getPlaybackState
]
