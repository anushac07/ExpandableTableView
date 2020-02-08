//
//  CellData.swift
//  expandabletableview
//
//  Created by C Anusha on 11/17/1398 AP.
//  Copyright © 1398 C Anusha. All rights reserved.
//

import Foundation

struct cellData
{
    var opened = Bool()
    var title = String()
    var Sectiondata = [String]()
    
}

/** Sample json file. Do API call to get actual data */
let jsonString = """
{ "data": {
  "posts": [
    {
        "author": "John",
        "opened": false,
        "comment_list": [{"author": "fname", "content": "contents"},{"author": "lname", "content": "contents2"}],
        "content": "Post body content",
        "post_id": 2,
        "title": "Heading",
        "upvotes": 5
    },
    {
        "author": "Anusha",
        "opened": false,
        "comment_list": [],
        "content": "Post body content1",
        "post_id": 3,
        "title": "Heading1",
        "upvotes": 9
    },
]
}
}
"""



struct DataResponse: Decodable {
    var data: Posts
    
}

struct Posts: Decodable {
    var posts: [PostDetails]
}

struct PostDetails: Decodable {
    var author: String
    var opened: Bool
    var comment_list: [CommentDetails]
    var content: String
   // var time: String
    var title: String
    var upvotes: Int
    
}

struct CommentDetails: Decodable {
    var author: String
    var content: String
}

func decodess(compleation: @escaping(Result<[PostDetails], PostError>) ->Void){
guard let jsonData = jsonString.data(using: .utf8) else {
    compleation(.failure(.noDataAvailable))
    return
}
    do {
let decoder = JSONDecoder()

let respString = try decoder.decode(DataResponse.self, from: jsonData)
    print(respString.data.posts)
        let postDetails = respString.data.posts
       compleation(.success(postDetails))
       }
   // for post in respString.data.posts
 //   {
    //    print(post.upvotes)
 //   }
catch
{compleation(.failure(.canNotProcessData))
    
    }
    
}
