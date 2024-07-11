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
	#category : #baseline,
	#'squeak_changestamp' : 'TL 7/11/2024 19:56'
}
BaselineOfSpotifyConnect >> baseline: spec [

         <baseline>
         spec
             for: #'common'
             do: [
			spec
				baseline: 'Squot' with: [
					spec repository: 'github://hpi-swa/Squot:mapper/src'].
                 spec
                     package: 'SpotifyConnect' with: [spec requires: #('Squot')].
                 spec
                     group: 'default' with: #('SpotifyConnect');
                     group: 'tests' with: #('SpotifyConnect');
                     yourself]
]
