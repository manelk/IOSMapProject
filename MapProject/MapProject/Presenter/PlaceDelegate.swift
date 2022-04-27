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
    func fetchAllPlaces()
    {
        placeNotifier.showLoading()
        placeNotifier.hideLoading()
        
        var myArr:[MyPlaceModel] = [MyPlaceModel(title: "", category: "", distance: "")]
        placeNotifier.getAllPlaces(listOfPlaces: myArr)
        //placeNotifier.hideLoading()
    }
}
