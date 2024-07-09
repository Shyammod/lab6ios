//
//  FriendsPageViewController.swift
//  Lab6
//
//  Created by user228349 on 7/8/24.
//

import UIKit

class Friend {
    let firstName: String
    let email: String
    let phoneNumber: String

    init(firstName: String, email: String, phoneNumber: String) {
        self.firstName = firstName
        self.email = email
        self.phoneNumber = phoneNumber
    }
}

    
class FriendsPageController: UITableViewController {
    var friends: [Friend] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(AddfriendTableViewCell.self, forCellReuseIdentifier: "FriendCell")
        tableView.allowsSelection = false
        tableView.allowsMultipleSelectionDuringEditing = false
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! AddfriendTableViewCell
        let friend = friends[indexPath.row]
        cell.configure(with:friend)
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            friends.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    @IBAction func `switch`(_ sender: Any) {
    }
    @IBAction func addFriendButtonTapped(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Add Friend", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "First Name"
        }
        alertController.addTextField { textField in
            textField.placeholder = "Email"
        }
        alertController.addTextField { textField in
            textField.placeholder = "Phone Number"
        }
        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            guard let self = self else { return }
            let firstName = alertController.textFields?[0].text ?? ""
            let email = alertController.textFields?[1].text ?? ""
            let phoneNumber = alertController.textFields?[2].text ?? ""
            let friend = Friend(firstName: firstName, email: email, phoneNumber: phoneNumber)
            self.friends.append(friend)
            self.tableView.insertRows(at: [IndexPath(row: self.friends.count - 1, section: 0)], with: .automatic)
        }
        alertController.addAction(addAction)
        present(alertController, animated: true)
    }
}

