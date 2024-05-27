Class {
	#name : #SPOCAssetImageMorph,
	#superclass : #ImageMorph,
	#category : #'SpotifyConnect-Utils'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'TL 5/27/2024 01:31'
}
SPOCAssetImageMorph class >> gitRepoName [

	^ 'SpotifyConnect'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TL 5/27/2024 12:12'
}
SPOCAssetImageMorph >> assetPath: anAssetPath [

	self image: (self loadAsset: anAssetPath).
	self changed
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TL 5/27/2024 12:12'
}
SPOCAssetImageMorph >> loadAsset: anAssetPath [

	^ (GitAssetLoader for: self class gitRepoName) loadAsset: anAssetPath
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'TL 5/27/2024 01:32'
}
SPOCAssetImageMorph >> magnifyBy: aMagnification [

	self image: (self form magnifyBy: aMagnification)
]
