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

	let itemArray = ["ABC", "DEF", "GHI"]

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}


	//MARK  - TableView Datasource Methods


	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
		cell.textLabel?.text = itemArray[indexPath.row]
		return cell

	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return itemArray.count
	}

//MARK - TableView Delegate Methods


	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//		print(itemArray[indexPath.row])
		if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark
		{
			tableView.cellForRow(at: indexPath)?.accessoryType = .none
		}
		else
		{
			tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
		}
		tableView.deselectRow(at: indexPath, animated: true)
	}



}

