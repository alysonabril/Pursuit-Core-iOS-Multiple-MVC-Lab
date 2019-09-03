//
//  ViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Tom Seymour on 11/2/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var animalTableView: UITableView!
    
    var animals = ZooAnimal.zooAnimals
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DetailViewController,
            let indexPath = animalTableView.indexPathForSelectedRow else {return}
        let selectedAnimal = animals[indexPath.row]
        destination.animalInfo = selectedAnimal
    }

    private func configureTableView() {
        animalTableView.delegate = self
        animalTableView.dataSource = self
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let animal = animals[indexPath.row]
        if let cell = animalTableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath) as? AnimalTableViewCell {
            cell.animalImage.image = UIImage(named: "\(animal.imageNumber)")
            cell.nameLabel.text = animal.name
            cell.originLabel.text = "\(animal.classification), \(animal.origin)"
            return cell
        }
        let cell = UITableViewCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
}

