//
//  ViewController.swift
//  MapProject
//
//  Created by Orangeodc10 on 26/4/2022.
//

import UIKit
// 2- add UITableViewDataSource
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var tab: [String] = ["", "", ""]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tab.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let MyCell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath ) as! MyTableViewCell
        MyCell.titleLabel.text = "Title"
        MyCell.categoryLabel.text = "cat 1"
        MyCell.distanceLabel.text = "2222"
        return MyCell
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
    }

}

