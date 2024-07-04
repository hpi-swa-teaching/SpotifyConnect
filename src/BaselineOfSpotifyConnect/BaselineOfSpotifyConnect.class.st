"
Baseline class
"
Class {
	#name : #BaselineOfSpotifyConnect,
	#superclass : #BaselineOf,
	#category : #BaselineOfSpotifyConnect,
	#'squeak_changestamp' : 'OW 7/4/2024 12:32'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 6/24/2024 15:08'
}
BaselineOfSpotifyConnect >> baseline: spec [
         <baseline>
         spec
             for: #'common'
             do: [
			spec
				baseline: 'Squot' with: [
					spec repository: 'github://hpi-swa/Squot:mapper/src'. ].
                 spec
                     package: 'SpotifyConnect' with: [spec requires: #('Squot')];
                     yourself.
                 spec
                     group: 'default' with: #('SpotifyConnect');
                     group: 'tests' with: #('SpotifyConnect');
                     yourself].
]
