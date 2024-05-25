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
	#'squeak_changestamp' : 'VK 5/25/2024 18:47'
}
SPOCTestApiSearch >> testExecute [
	| dict res firstTrack |
	dict := Dictionary new.
	res := apiEndpoint execute: dict.
	firstTrack := res first.
	self assert: firstTrack id = '45c4L5n0wh6KRv0SOf879S'.
	self assert: firstTrack name = 'Morning Blue'.
	self assert: firstTrack album class = SPOCAlbum.
	self assert: firstTrack duration = 217.
	self assert: firstTrack explicit = false.
	self assert: firstTrack popularity = 59.
	self assert: firstTrack trackNumber = 11.
]
