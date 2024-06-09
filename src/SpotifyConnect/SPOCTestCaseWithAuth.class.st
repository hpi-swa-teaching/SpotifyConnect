Class {
	#name : #SPOCTestCaseWithAuth,
	#superclass : #TestCase,
	#instVars : [
		'apiEndpoint'
	],
	#category : #'SpotifyConnect-Auth-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 6/5/2024 18:53'
}
SPOCTestCaseWithAuth class >> resources [

	^ { SPOCAuthTestResource }
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/9/2024 18:45'
}
SPOCTestCaseWithAuth >> apiEndpoint [
	^ apiEndpoint
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'TL 6/9/2024 18:45'
}
SPOCTestCaseWithAuth >> apiEndpoint: anObject [
	apiEndpoint := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 6/5/2024 18:57'
}
SPOCTestCaseWithAuth >> auth [

	^ SPOCTestCaseWithAuth resources first current auth
]
