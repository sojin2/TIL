//
//  ViewController.swift
//  Urlsession
//
//  Created by HelloDigital_iOS_Dev on 2022/04/01.
//

import Foundation

struct MoveModel: Codable {
    let items: [Movie]
}


struct Movie: Codable {
    let title: String
    let ling: String
    let image: String
    let subtitle: String
    let pubData: String
    let director: String
    let actor: String
    let userRating: String
}


let config = URLSessionConfiguration.default

let session = URLSession(configuration: config)

var urlComponents = URLComponents(string: "https://openapi.naver.com/v1/search/movie.json?query=lego")!

var requestURL = urlComponents.url!

let dataTask = session.dataTask(with: requestURL) { data, response, error in
    let successRange = 200..<300
    guard error == nil, let statusCode = (response as? HTTPURLResponse)?.statusCode, successRange.contains(statusCode) else {
        return
    }
    
    guard let resultData = data else {
        return
    }
    
    
    do {
        let decoder = JSONDecoder()
        let response = try decoder.decode(MoveModel.self, from: resultData)
        let items = response.items
        print(items.count)
        for item in items {
            print("title: \(item.title)")
            print("artistName: \(item.director)")
            print("")
        }
    } catch let error {
        print("--> error: \(error.localizedDescription)")
    }
}.resume()
