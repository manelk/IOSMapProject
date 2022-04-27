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

class MyPlacePoint: Decodable {
    var lon: Double?
    var lat: Double?
}

class MyPlaceModel :Decodable{
    
    var xid : String?
    var name: String?
    var dist: Double?
    var kinds: String?
    var point: MyPlacePoint?
}
