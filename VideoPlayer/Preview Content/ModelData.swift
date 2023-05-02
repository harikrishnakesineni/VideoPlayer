//
//  ModelData.swift
//  VideoPlayer
//
//  Created by Hari krishna on 30/04/23.
//

import Foundation

let previewData: Video = loadData("videoData")

func loadData<T: Decodable> (_ fileName: String) -> T {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
        fatalError("Couldn't find \(fileName) in main bundle")
    }
    
    do {
        let data = try Data(contentsOf: url)
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        return decodedData
    } catch {
        fatalError("Couldn't parse json file")
    }
    
    
    
}
