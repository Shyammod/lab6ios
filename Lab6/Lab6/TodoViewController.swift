//
//  TodoViewController.swift
//  Lab6
//
//  Created by user228349 on 7/8/24.
//

import UIKit

struct Todo {
    var title: String
    var section: String

class TodoViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var todos: [String: [Todo]] = [
           "Work": [Todo(title: "Wash dishes", section: "Work")],
           "Home": [Todo(title: "Wash clothes", section: "Home")],
           // Add more sample todos here
       ]
       var sections: [String] {
           return Array(todos.keys)
       }

       let tableView = UITableView()
       let sectionTextField = UITextField()
       let todoTextField = UITextField()

       override func viewDidLoad() {
           super.viewDidLoad()
           setupInputArea()
           setupTableView()
           loadSampleTodos()
       }
    
    @IBOutlet weak var tableview1: UITableView!
    
    
       func setupInputArea() {
           sectionTextField.placeholder = "Enter section"
           todoTextField.placeholder = "Enter todo item"
           let stackView = UIStackView(arrangedSubviews: [sectionTextField, todoTextField])
           stackView.axis = .vertical
           stackView.spacing = 8
           view.addSubview(stackView)
           stackView.translatesAutoresizingMaskIntoConstraints = false
           stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
           stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
           stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true

           let addButton = UIButton(type: .system)
           addButton.setTitle("Add", for: .normal)
           addButton.addTarget(self, action: #selector(addTodo), for: .touchUpInside)
           view.addSubview(addButton)
           addButton.translatesAutoresizingMaskIntoConstraints = false
           addButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8).isActive = true
           addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       }

       func setupTableView() {
           view.addSubview(tableView)
           tableView.translatesAutoresizingMaskIntoConstraints = false
           tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height / 3).isActive = true
           tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
           tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
           tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

           tableView.dataSource = self
           tableView.delegate = self
           tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TodoCell")
       }

       @objc func addTodo() {
           let section = sectionTextField.text ?? ""
           let todoTitle = todoTextField.text ?? ""
           let newTodo = Todo(title: todoTitle, section: section)

           if todos[section] != nil {
               todos[section]?.append(newTodo)
           } else {
               todos[section] = [newTodo]
           }
           tableView.reloadData()
       }

       func loadSampleTodos() {
           // Add sample data
       }

       // MARK: - Table view data source
       func numberOfSections(in tableView: UITableView) -> Int {
           return sections.count
       }

       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           let sectionKey = sections[section]
           return todos[sectionKey]?.count ?? 0
       }

       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
           let sectionKey = sections[indexPath.section]
           let todo = todos[sectionKey]?[indexPath.row]
           cell.textLabel?.text = todo?.title
           return cell
       }

       func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle == .delete {
               let sectionKey = sections[indexPath.section]
               todos[sectionKey]?.remove(at: indexPath.row)
               tableView.deleteRows(at: [indexPath], with: .fade)
           }
       }
   }
    
    
    
    
    
}
