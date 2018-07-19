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

	let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.


		print(dataFilePath)


		loadItems()

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
		saveItems()


		tableView.reloadData()
		tableView.deselectRow(at: indexPath, animated: true)
	}

	@IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
		var textField = UITextField()

		let alert = UIAlertController(title: "Add Item Now", message: "", preferredStyle: .alert)

		let action = UIAlertAction(title: "Add Item", style: .default) { (action) in

			let newItem = Item()
			newItem.title = textField.text!

			self.itemArray.append(newItem)

			self.saveItems()


		}

		alert.addTextField { (alertTextField) in
			alertTextField.placeholder = "Add something ..."
			textField = alertTextField


		}
		alert.addAction(action)
		present(alert, animated: true, completion: nil)
	}

	func saveItems()
	{
		let encoder = PropertyListEncoder()

		do {
			let data = try encoder.encode(itemArray)
			try	data.write(to: dataFilePath!)
		}
		catch{
			print("Error encoding, \(error)")
		}

		self.tableView.reloadData()

	}
	
	func loadItems()
	{
		if let data = try? Data(contentsOf: dataFilePath!)
		{

			let decoder = PropertyListDecoder()
			do{
				itemArray = try decoder.decode([Item].self, from : data)
			}
			catch
			{
				print("Error \(error)")
			}
		}

	}

}
