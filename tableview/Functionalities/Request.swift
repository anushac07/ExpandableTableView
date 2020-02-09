//
//  Request.swift
//  segmentedtableview
//
//  Created by C Anusha on 11/19/1398 AP.
//  Copyright © 1398 C Anusha. All rights reserved.
//

import Foundation

enum PostError: Error{
    case noDataAvailable
    case canNotProcessData
}

struct PostRequest {
    var resourceURL: URL
    init (uri: String)  //initializer
    {
        let destinationURL = "https://glitter-web-app.herokuapp.com/api/\(uri)"
        guard let resourceURL = URL(string: destinationURL) else {fatalError()}
        
        self.resourceURL = resourceURL
    }
    
    func getPosts (compleation: @escaping(Result<[PostDetails], PostError>) ->Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in

            guard let jsonData = data  else {
                compleation(.failure(.noDataAvailable))
                return
            }

            do{
                //print(jsonData)
                let decoder = JSONDecoder()
                let postsResponse = try decoder.decode(Posts.self, from: jsonData)
                let postDetails = postsResponse.data
                print(postDetails)
                compleation(.success(postDetails))
            }catch{
                compleation(.failure(.canNotProcessData))
            }

        }
        dataTask.resume()
    }
    
    
}
