//
//  ApiService.swift
//  NewsFeed
//
//  Created by Vladislav Andreev on 02.11.2017.
//  Copyright © 2017 Vladislav Andreev. All rights reserved.
//

import Foundation

class ApiService {
    
    private let session = URLSession.shared
    private static let serviceUrl = "https://api.com/"
    
    func fetchCellModel(page: Int, userId: Int, completionHandler: @escaping (Result<CellModel>) -> Void) {
        
        let url = buildModelUrl(page: page, userId: userId)
        print(url)
        let urlRequest = URLRequest(url: url)
        
        let task = session.dataTask(with: urlRequest, completionHandler: { (data: Data?, response, err: Error?) -> Void in
            if let err = err {
                completionHandler(Result.failure(err))
            } else {
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                    if let json = jsonObject as? Serialization {
                        let model = CellModel(serialization: json)
                        completionHandler(Result.success(model))
                    }
                } catch _ {
                    let invalidJSONError = ModelIOError.invalidJSON(data!)
                    completionHandler(Result.failure(invalidJSONError))
                }
            }
        })
        task.resume()
        
    }
    
    private func buildModelUrl(page: Int, userId: Int) -> URL {
        
        //  Build URL query parameters
        var urlBuilder = URLComponents(string: ApiService.serviceUrl)!
        
        //  Build URL query parameters
        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "page", value: page.description))
        queryItems.append(URLQueryItem(name: "userId", value: userId.description))

        urlBuilder.queryItems = queryItems
        
        return urlBuilder.url!
    }
}

