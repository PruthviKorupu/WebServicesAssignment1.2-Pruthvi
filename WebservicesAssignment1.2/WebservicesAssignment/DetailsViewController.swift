//
//  DetailsViewController.swift
//  WebservicesAssignment
//
//  Created by GGKU5MACBOOK036 on 15/03/22.
//

import UIKit

class DetailsViewController: UIViewController {

    var selectedDog = NSMutableDictionary()
    @IBOutlet weak var lblDogName: UILabel!
    @IBOutlet weak var lblDogDescription: UILabel!
    @IBOutlet weak var imageDog: UIImageView!
    @IBOutlet weak var lblDogSubBread: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUIWithDogdata()
    }
    
    func setUIWithDogdata() {
        if let name = selectedDog.value(forKey: "name") as? String {
            lblDogName.text = name
        }
        
        if let subBread = selectedDog.value(forKey: "subbread") as? [String], subBread.count > 0 {
            lblDogSubBread.isHidden = false
            lblDogSubBread.text = subBread.joined(separator: ",")
        }
        
        if let image = selectedDog.value(forKey: "image") as? String,
           let url = URL(string:image), let data = try? Data(contentsOf: url),
           let image = UIImage(data: data) {
            imageDog.image = image
        }
    }

}
