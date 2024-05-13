"
store pair of access and refresh token
"
Class {
	#name : #SPOCAccessTokens,
	#superclass : #Object,
	#instVars : [
		'accessToken',
		'refreshToken'
	],
	#category : #SpotifyConnect,
	#'squeak_changestamp' : 'OW 5/13/2024 17:32'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'OW 5/13/2024 17:20'
}
SPOCAccessTokens >> accessToken [

	^ accessToken
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'OW 5/13/2024 17:20'
}
SPOCAccessTokens >> accessToken: anAccessToken [

	accessToken := anAccessToken
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'OW 5/13/2024 17:20'
}
SPOCAccessTokens >> refreshToken [

	^ refreshToken
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'OW 5/13/2024 17:21'
}
SPOCAccessTokens >> refreshToken: aRefreshToken [

	refreshToken := aRefreshToken
]
