//
//  Video.swift
//  VideoPlayer
//
//  Created by Hari krishna on 30/04/23.
//

import Foundation

struct Video: Identifiable, Decodable {
    var id: Int
    var width: Int
    var height: Int
    var url: String
    var image: String
    var duration: Int
    var user: User
    var videoFiles: [VideoFile]
    var videoPictures: [VideoPicture]
    
    enum CodingKeys: String, CodingKey {
        case id
        case width
        case height
        case url
        case image
        case duration
        case user
        case videoFiles = "video_files"
        case videoPictures = "video_pictures"
    }
    
    
}

