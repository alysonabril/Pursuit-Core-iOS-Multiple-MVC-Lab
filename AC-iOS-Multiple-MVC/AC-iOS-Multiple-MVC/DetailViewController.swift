//
//  DetailViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Alyson Abril on 9/3/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var animalName: UILabel!
    @IBOutlet weak var animalInfoTextView: UITextView!
    
    var animalInfo: ZooAnimal!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureDVC()
    }
    

    private func configureDVC() {
    animalImage.image = UIImage(named: "\(animalInfo.imageNumber)")
        animalName.text = animalInfo.name
        animalInfoTextView.text = animalInfo.info
    }

}
