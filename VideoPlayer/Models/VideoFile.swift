//
//  VideoFile.swift
//  VideoPlayer
//
//  Created by Hari krishna on 30/04/23.
//

import Foundation

struct VideoFile: Identifiable, Decodable {
    var id: Int
    var quality: String
    var fileType: String
    var width: Int
    var height: Int
    var link: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case quality
        case fileType = "file_type"
        case width
        case height
        case link
    }
    
}
