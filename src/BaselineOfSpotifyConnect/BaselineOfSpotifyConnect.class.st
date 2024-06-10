Class {
	#name : #BaselineOfSpotifyConnect,
	#superclass : #BaselineOf,
	#category : #BaselineOfSpotifyConnect
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 6/10/2024 23:51'
}
BaselineOfSpotifyConnect >> baseline: spec [
         <baseline>
         spec
             for: #'common'
             do: [
                 spec
                     package: 'SpotifyConnect';
                     "package: 'SpotifyConnect-Tests' with: [spec requires: #('default')];"
                     yourself.
                 spec
                     group: 'default' with: #('SpotifyConnect');
                     group: 'tests' with: #('SpotifyConnect');
                     yourself].
]
