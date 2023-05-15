//
//  VideoManager.swift
//  VideoPlayer
//
//  Created by Hari krishna on 30/04/23.
//

import Foundation

enum Query: String, CaseIterable {
    case food, animal, nature, people, ocean
}

enum NetworkError: Error {
    case invalidURL
    case badResponse

}

@MainActor
class VideoManager: ObservableObject {
    @Published var videos: [Video] = []
    @Published var selectedQuery: Query = .nature {
        didSet{
            Task.init {
                 try await fetchVideos(loadQuery: selectedQuery)
            }
        }
    }
    
    init() {
        Task.init {
             try await fetchVideos(loadQuery: selectedQuery)
        }
    }
    
    @MainActor
    func fetchVideos(loadQuery: Query) async throws {
        guard let url = URL(string: "https://api.pexels.com/videos/search?query=\(loadQuery.rawValue)&per_page=10&orientation=portrait") else {
            throw NetworkError.invalidURL
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("8tORojrmkbm2PvOlxdlNFhPAmg31Q06SZgDc8R9VFHjYSSsefQPfQdve", forHTTPHeaderField: "Authorization")
        //urlRequest.setValue("cRnXzAZzKGoEGlmBhe9MyIDH28Ue6YsNmubiZxmuf6SJOG0X0dzxIeTc", forHTTPHeaderField: "Authorization")
        //urlRequest.httpMethod = "POST"
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        self.videos = []
        videos = decodedData.videos
        
    }
    
    
    
}
