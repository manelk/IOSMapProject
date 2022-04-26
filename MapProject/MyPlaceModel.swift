//
//  MyPlaceModel.swift
//  MapProject
//
//  Created by Orangeodc10 on 26/4/2022.

// Commnets by: Manel Kacem
// Create model that contains objects to fetch later in view table.
// Decodable: helps decode JSON file as long as they have same names and types
// Others: encodable and codable

import Foundation
class MyPlaceModel : Decodable{
    var title : String = ""
    var category : String = ""
    var distance : String = ""
    
    init(title: String, category: String, distance: String) {
        self.title = title
        self.category = category
        self.distance = distance
    }
}
