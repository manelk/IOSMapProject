//
//  ViewController.swift
//  MapProject
//
//  Created by Orangeodc10 on 26/4/2022.
//

import UIKit
// 2- add UITableViewDataSource 
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, PlaceNotifier {
    func showLoading() {
        //TODO: show loading implementation
        print("Print")
     
    }
    
    func getAllPlaces(listOfPlaces:[MyPlaceModel]) {
        //TODO: fetch all logic
        print("Size is:", listOfPlaces.count)
        self.tab = listOfPlaces
        self.tableView.reloadData()
    }
    
    func hideLoading() {
        //TODO: hide loading implementation
        print("Hide Print")
    }
    
    var presenter:PlacePresenter = PlacePresenter(placeService: PlaceService())
    var tab: [MyPlaceModel] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tab.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let MyCell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath ) as! MyTableViewCell
        MyCell.titleLabel.text = self.tab[ indexPath.row].name
        MyCell.categoryLabel.text = self.tab[ indexPath.row].kinds
        MyCell.distanceLabel.text = self.tab[ indexPath.row].dist?.description
        return MyCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "MoveToDetails", sender: self.tab[indexPath.row])
    }
    
    @IBOutlet weak var tableView: UITableView!
    //@IBAction func btnDidTapped(_ sender: Any) {
    //}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.presenter.placeNotifier = self
        self.presenter.fetchAllPlaces()
       // self.presenter.placeNotifier.hideLoading()
        // 1- First step is to connect cell with the table view
        tableView.register(UINib.init(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "MyTableViewCell")
        tableView.reloadData()
      //  performSegue(withIdentifier: "MoveToDetails", sender: nil)
        
    }
    
    override func prepare ( for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "MoveToDetails" {
            let destination = segue.destination as! MyPlaceDetailsViewController
            let placeObject = sender as! MyPlaceModel
            destination.MyPlaceModel = placeObject
        }
    }

}

