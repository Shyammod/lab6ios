//
//  friendViewController.swift
//  Lab6
//
//  Created by user228349 on 7/8/24.
//

import UIKit



class friendViewController: UITableViewController {
    var friends: [Friend] = [
            Friend(firstName: "John", email: "john@example.com", phone: "123-456-7890", images: [UIImage(named: "image1")!, UIImage(named: "image2")!, UIImage(named: "image3")!])
            // Add more sample friends here
        ]

        override func viewDidLoad() {
            super.viewDidLoad()
            setupTableView()
            setupNavigationBar()
        }

        func setupTableView() {
            tableView.register(FriendTableViewCell.self, forCellReuseIdentifier: "FriendCell")
            tableView.allowsMultipleSelectionDuringEditing = true
        }

        func setupNavigationBar() {
            navigationItem.title = "Friends"
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addFriend))
        }

        @objc func addFriend() {
            let alert = UIAlertController(title: "Add Friend", message: "Enter friend details", preferredStyle: .alert)
            alert.addTextField { textField in
                textField.placeholder = "First Name"
            }
            alert.addTextField { textField in
                textField.placeholder = "Email"
            }
            alert.addTextField { textField in
                textField.placeholder = "Phone"
            }
            alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { _ in
                let firstName = alert.textFields?[0].text ?? ""
                let email = alert.textFields?[1].text ?? ""
                let phone = alert.textFields?[2].text ?? ""
                let newFriend = Friend(firstName: firstName, email: email, phone: phone, images: [UIImage(named: "image1")!, UIImage(named: "image2")!, UIImage(named: "image3")!])
                self.friends.append(newFriend)
                self.tableView.reloadData()
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }

        // MARK: - Table view data source
        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return friends.count
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendTableViewCell
            let friend = friends[indexPath.row]
            cell.configure(with: friend)
            return cell
        }

        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                friends.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }

        override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
            let movedFriend = friends.remove(at: sourceIndexPath.row)
            friends.insert(movedFriend, at: destinationIndexPath.row)
        }
    }
   
