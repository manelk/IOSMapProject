//
//  ViewController.swift
//  MapProject
//
//  Created by Orangeodc10 on 26/4/2022.
//

import UIKit
// 2- add UITableViewDataSource 
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var tab: [MyPlaceModel] = [MyPlaceModel(
        title:"title1", category: "category1", distance: "distance1"),MyPlaceModel(
        title:"title2", category: "category2", distance: "distance2")]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tab.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let MyCell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath ) as! MyTableViewCell
        MyCell.titleLabel.text = self.tab[ indexPath.row].title
        MyCell.categoryLabel.text = self.tab[ indexPath.row].category
        MyCell.distanceLabel.text = self.tab[ indexPath.row].distance
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

