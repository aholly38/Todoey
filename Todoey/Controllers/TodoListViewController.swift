//
//  ViewController.swift
//  Todoey
//
//  Created by Alain on 2/22/18.
//  Copyright © 2018 Alain Holly. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Black Panther"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Captain America"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Ironman"
        itemArray.append(newItem3)
        
      
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {

            itemArray = items

        }
        
    }

    //Mark - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        print("cellForRowAtIndexPathCalled")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        // Ternary Operator ==>
        // value = condition ? valueIfTrue : valueIfFalse
        
        cell.accessoryType = item.done == true ? .checkmark : .none
        
//        if item.done == true {
//
//            cell.accessoryType = .checkmark
//
//        } else {
//
//            cell.accessoryType = .none
//        }
        
        
        return cell
    }
    
    //Mark - Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       // print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //Mark - Add New Items
    
    @IBAction func addButtonPresssed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what will happen when the user clicks the Add Item button on our UIAlert
               
              print(textField)
            
              let newItem = Item()
              newItem.title = textField.text!
            
              self.itemArray.append(newItem) 
            
              self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
              self.tableView.reloadData()
                
            }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
      
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    

}

