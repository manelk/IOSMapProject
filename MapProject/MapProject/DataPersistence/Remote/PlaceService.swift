//
//  PlaceService.swift
//  MapProject
//
//  Created by Orangeodc10 on 27/4/2022.
//

import Foundation

class PlaceService {
    
    func getAll(url: String, method: String) async throws -> Any?
    {
        // guard: if nill break
        guard let url = URL(string: url) else { return nil}
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = method
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        print("hey", String(data: data, encoding: .utf8))
        
        // 2 things: test response and cast it
        if let response = ( response as? HTTPURLResponse)
        {
            if response.statusCode == 200
            {
                return try JSONDecoder().decode([MyPlaceModel].self, from: data)
            }else {
                return nil
            }
        }else
        {
            return nil
        }
    }
    
}
