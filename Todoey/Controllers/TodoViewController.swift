//
//  ViewController.swift
//  Todoey
//
//  Created by Shankar R N S on 7/18/18.
//  Copyright © 2018 RNS. All rights reserved.
//

import UIKit

class TodoViewController: UITableViewController
{

	var itemArray = [Item]()
	let defaults = UserDefaults.standard

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		let newItem = Item()
		newItem.title = "Find Mike"
		itemArray.append(newItem)

		let newItem2 = Item()
		newItem2.title = "Find Mike2"
		itemArray.append(newItem2)


		let newItem3 = Item()
		newItem3.title = "Find Mike3"
		itemArray.append(newItem3)


		let newItem4 = Item()
		newItem4.title = "Find Mike4"
		itemArray.append(newItem4)



if let items = defaults.array(forKey: "TodoListArray") as? [Item]
{
	itemArray = items
	}
}

	//MARK  - TableView Datasource Methods


	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)

		let item = itemArray[indexPath.row]
		cell.textLabel?.text = item.title



		if item.done == true
		{
			cell.accessoryType = .checkmark

		}
		else
		{
cell.accessoryType = .none


		}

		return cell

	}





	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return itemArray.count
	}

//MARK - TableView Delegate Methods


	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//		print(itemArray[indexPath.row])

		itemArray[indexPath.row].done = !itemArray[indexPath.row].done

		tableView.reloadData()

	}

	@IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
		var textField = UITextField()

		let alert = UIAlertController(title: "Add Item Now", message: "", preferredStyle: .alert)


		let action = UIAlertAction(title: "Add Item", style: .default) { (action) in

			let newItem = Item()
			newItem.title = textField.text!


			self.itemArray.append(newItem)
			self.defaults.set(self.itemArray, forKey : "TodoListArray")

			self.tableView.reloadData()
		}

		alert.addTextField { (alertTextField) in
			alertTextField.placeholder = "Add something ..."
textField = alertTextField


		}
		alert.addAction(action)
		present(alert, animated: true, completion: nil)
	}


}

