//
//  CarViewController.swift
//  Lab6
//
//  Created by user228349 on 7/3/24.
//

import UIKit

struct Car {
    let make: String
    let model: String
    let image : UIImage?
}

class CarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var cars: [Car] = []

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
            super.viewDidLoad()
            self.title = "Cars"
            setupTableView()
            setupNavigationBar()
            loadSampleData()
        }
    
    
        func setupTableView() {
            tableView.delegate = self
            tableView.dataSource = self
                    }

        func setupNavigationBar() {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCar))
            let editSwitch = UISwitch()
            editSwitch.addTarget(self, action: #selector(toggleEditMode), for: .valueChanged)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: editSwitch)
        }

        @objc func addCar() {
            let alert = UIAlertController(title: "Add Car", message: "Enter car details", preferredStyle: .alert)
            alert.addTextField { (textField) in textField.placeholder = "Make" }
            alert.addTextField { (textField) in textField.placeholder = "Model" }
            alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { _ in
                if let make = alert.textFields?[0].text, let model = alert.textFields?[1].text {
                    let newCar = Car(make: make, model: model, image: UIImage(named: "defaultCar")!)
                    self.cars.append(newCar)
                    self.tableView.reloadData()
                }
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil));            present(alert, animated: true, completion: nil)
        }

        @objc func toggleEditMode() {
            tableView.setEditing(!tableView.isEditing, animated: true)
        }

        func loadSampleData() {
            // Sample data for cars
            cars = [
                Car(make: "Audi", model: "Q8", image: UIImage(named: "defaultCar") ?? nil),
                Car(make: "BMW", model: "M3", image: UIImage(named: "defaultCar")),
                Car(make: "VW", model: "POLO", image: UIImage(named: "defaultCar")),
                // Add more cars..
                
            ]
        }

        // MARK: - UITableViewDataSource
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return cars.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! carViewCell
            let car = cars[indexPath.row]
            cell.q8?.text = "\(car.make) \(car.model) - \(car.image)"
            
            return cell
        }

        // MARK: - UITableViewDelegate
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                cars.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }


    
