//
//  SecondVC.swift
//  RockPaperScissorsApp
//
//  Created by Ecem Akçay on 8.07.2023.
//

import UIKit

class SecondVC: UIViewController {
        @IBOutlet weak var resultLabel: UILabel!
        @IBOutlet weak var pcImage: UIImageView!
        @IBOutlet weak var userImage: UIImageView!
        
        var userSelection: UIImage?
        var pcSelection: UIImage?
        var result: String?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            userImage.layer.cornerRadius = 30
            pcImage.layer.cornerRadius = 30
          
            
            
            userImage.image = userSelection
            pcImage.image = pcSelection
            resultLabel.text = result
            
        }


}
