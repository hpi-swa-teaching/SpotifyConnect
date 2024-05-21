Class {
	#name : #SPOCApiTrack,
	#superclass : #SPOCApiEndpoint,
	#category : #SpotifyConnect
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 12:14'
}
SPOCApiTrack >> endpoint [
	^ 'v1/tracks/'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 12:05'
}
SPOCApiTrack >> endpointMethod [
	^ 'GET'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 12:21'
}
SPOCApiTrack >> executeRequest: request withParams: aParameterDictionary [

	request rawUrl: (request rawUrl, (aParameterDictionary at: 'trackId')).
	^ self client sendRequest: request
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 18:02'
}
SPOCApiTrack >> executeTest [
	^ '{"album":{"album_type":"single","artists":[{"external_urls":{"spotify":"https://open.spotify.com/artist/6sFIWsNpZYqfjUpaCgueju"},"href":"https://api.spotify.com/v1/artists/6sFIWsNpZYqfjUpaCgueju","id":"6sFIWsNpZYqfjUpaCgueju","name":"Carly Rae Jepsen","type":"artist","uri":"spotify:artist:6sFIWsNpZYqfjUpaCgueju"}],"available_markets":[],"external_urls":{"spotify":"https://open.spotify.com/album/0tGPJ0bkWOUmH7MEOR77qc"},"href":"https://api.spotify.com/v1/albums/0tGPJ0bkWOUmH7MEOR77qc","id":"0tGPJ0bkWOUmH7MEOR77qc","images":[{"url":"https://i.scdn.co/image/ab67616d0000b2737359994525d219f64872d3b1","width":640,"height":640},{"url":"https://i.scdn.co/image/ab67616d00001e027359994525d219f64872d3b1","width":300,"height":300},{"url":"https://i.scdn.co/image/ab67616d000048517359994525d219f64872d3b1","width":64,"height":64}],"name":"Cut To The Feeling","release_date":"2017-05-26","release_date_precision":"day","total_tracks":1,"type":"album","uri":"spotify:album:0tGPJ0bkWOUmH7MEOR77qc"},"artists":[{"external_urls":{"spotify":"https://open.spotify.com/artist/6sFIWsNpZYqfjUpaCgueju"},"href":"https://api.spotify.com/v1/artists/6sFIWsNpZYqfjUpaCgueju","id":"6sFIWsNpZYqfjUpaCgueju","name":"Carly Rae Jepsen","type":"artist","uri":"spotify:artist:6sFIWsNpZYqfjUpaCgueju"}],"available_markets":[],"disc_number":1,"duration_ms":207959,"explicit":false,"external_ids":{"isrc":"USUM71703861"},"external_urls":{"spotify":"https://open.spotify.com/track/11dFghVXANMlKmJXsNCbNl"},"href":"https://api.spotify.com/v1/tracks/11dFghVXANMlKmJXsNCbNl","id":"11dFghVXANMlKmJXsNCbNl","is_local":false,"name":"Cut To The Feeling","popularity":0,"preview_url":null,"track_number":1,"type":"track","uri":"spotify:track:11dFghVXANMlKmJXsNCbNl"}' readStream
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'VE 5/15/2024 18:01'
}
SPOCApiTrack >> tinkerReponseContent: aContentStream [
	^ Json readFrom: aContentStream
]