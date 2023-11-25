//
//  MovieDBClient.swift
//  movieDB_gyak
//
//  Created by David Ferka on 24/11/2023.
//

import Foundation

class MovieDBClient: ObservableObject {
    @Published var npr = NowPlayingResponse()
    
    let apiKey = "13b3eda5772245701a76cba4d59e5eaf"
    let baseURL = "https://api.themoviedb.org/3/"
    @Published var imgBaseUrl = "https://image.tmdb.org/t/p/w500"
    
    
    
    
    enum NetworkError: Error {
        case invalidURL
        case requestFailId(String)
    }
    
    func getNowPlayingAsync() async throws -> NowPlayingResponse {
        guard let url = URL(string: "\(baseURL)movie/now_playing?api_key=\(apiKey)") else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.requestFailId("request failed")
        }
        
        return try JSONDecoder().decode(NowPlayingResponse.self, from: data)
    }
}
