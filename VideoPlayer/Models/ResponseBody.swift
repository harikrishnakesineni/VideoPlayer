//
//  ResponseBody.swift
//  VideoPlayer
//
//  Created by Hari krishna on 30/04/23.
//

import Foundation


struct ResponseBody: Decodable {
    var page: Int
    var perPage: Int
    var totalResults: Int
    var url: String
    var videos: [Video]
    
    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case totalResults = "total_results"
        case url
        case videos
    }
}


