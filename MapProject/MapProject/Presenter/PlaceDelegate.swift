//
//  PlaceDelegate.swift
//  MapProject
//
//  Created by Orangeodc10 on 27/4/2022.
//

import Foundation

// Place Notifier is an interface - java analogy
// Present data to view

protocol PlaceNotifier {
    func showLoading()
    func getAllPlaces(listOfPlaces:[MyPlaceModel])
    func hideLoading()
}

class PlacePresenter
{
    // Required using !
    var placeNotifier:PlaceNotifier!
    
    var placeService : PlaceService
    
    init(placeService: PlaceService)
    {
        self.placeService = placeService
    }
    
    func fetchAllPlaces()
    {
        
        Task
        {
            let result = try await placeService.getAll(url: "https://api.opentripmap.com/0.1/en/places/radius?apikey=5ae2e3f221c38a28845f05b6e1e72f6e6fae9bc6a9473af209e333f9&radius=5000&lon=10.63699&lat=35.82539&rate=3&format=json", method: "GET")
            
            if let places = result as? [MyPlaceModel]
            {
                DispatchQueue.main.async {
                    places.map{
                    item in
                        item.kinds = item.kinds?.split(separator: ",").prefix(3).joined(separator: ", ")}
                    self.placeNotifier.getAllPlaces(listOfPlaces: places)
                }

            }else{
            }

        }
        placeNotifier.showLoading()
        placeNotifier.hideLoading()
        
        
        var myArr:[MyPlaceModel] = []
    
        //placeNotifier.hideLoading()
    }
}
