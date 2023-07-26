import UIKit

// URL

let urlString = "https://itunes.apple.com/search?media=music&entity=song&term=Gdragon"
let url = URL(string: urlString)

// 실제 주소
url?.absoluteString
// 네트워킹 방식 (http or https)
url?.scheme
// itunes.apple.com
url?.host
// /search
url?.path
// media=music&entity=song&term=Gdragon"
url?.query
url?.baseURL


let baseURL = URL(string: "https://itunes.apple.com")
let relativeURL = URL(string: "search?media=music&entity=song&term=Gdragon", relativeTo: baseURL)


relativeURL?.absoluteString
relativeURL?.scheme
relativeURL?.host
relativeURL?.path
relativeURL?.query
relativeURL?.baseURL


// URLComponents
// 각각의 아이템으로 추가하여 접근하고싶을때

var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")

// URLQueryItem : 자동으로 인코딩해줌
let mediaQuery  = URLQueryItem(name: "media", value: "music")
let entityQuery = URLQueryItem(name: "entity", value: "song")
let termQuery = URLQueryItem(name: "term", value: "지드래곤")

urlComponents?.queryItems?.append(mediaQuery)
urlComponents?.queryItems?.append(entityQuery)
urlComponents?.queryItems?.append(termQuery)

urlComponents?.url
urlComponents?.string
urlComponents?.queryItems
