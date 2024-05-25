Class {
	#name : #SPOCTestApiSearch,
	#superclass : #SPOCTestApiEndpoint,
	#category : #'SpotifyConnect-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 5/25/2024 18:05'
}
SPOCTestApiSearch >> setUp [
	apiEndpoint := SPOCApiSearch new.
	apiEndpoint returnsTestContent: true.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VK 5/25/2024 18:56'
}
SPOCTestApiSearch >> testExecute [
	| dict res track |
	dict := Dictionary new.
	res := apiEndpoint execute: dict.
	track := res first.
	self assert: track id = '45c4L5n0wh6KRv0SOf879S'.
	self assert: track name = 'Morning Blue'.
	self assert: track album class = SPOCAlbum.
	self assert: track duration = 217.
	self assert: track explicit = false.
	self assert: track popularity = 59.
	self assert: track trackNumber = 11.
]
