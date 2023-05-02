//
//  User.swift
//  VideoPlayer
//
//  Created by Hari krishna on 30/04/23.
//

import Foundation

struct User: Identifiable, Decodable {
    var id: Int
    var name: String
    var url: String    
}
