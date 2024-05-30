Class {
	#name : #BaselineOfSpotifyConnect,
	#superclass : #BaselineOf,
	#category : #BaselineOfSpotifyConnect
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'OW 5/30/2024 18:23'
}
BaselineOfSpotifyConnect >> baseline: spec [
         <baseline>
         spec
             for: #'common'
             do: [
                 spec
                     package: 'SpotifyConnect';
			   package: 'SpotifyConnect-Utils';
                     package: 'SpotifyConnect-Tests' with: [spec requires: #('default')];
                     yourself.
                 spec
                     group: 'default' with: #('SpotifyConnect' 'SpotifyConnect-Utils');
                     group: 'tests' with: #('SpotifyConnect-Tests');
                     yourself].
]
