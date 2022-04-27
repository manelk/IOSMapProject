//
//  MyPlaceDetailsViewController.swift
//  MapProject
//
//  Created by Orangeodc10 on 26/4/2022.
//

import UIKit

class MyPlaceDetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var textViewDescription: UITextView!
    @IBOutlet weak var labelCategory: UILabel!
    
    var MyPlaceModel: MyPlaceModel?
    @IBAction func buttonVisitMore(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let MyPlaceModel = MyPlaceModel {
            self.labelTitle.text = MyPlaceModel.name
            self.labelCategory.text = MyPlaceModel.kinds
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
