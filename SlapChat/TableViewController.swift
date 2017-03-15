//
//  TableViewController.swift
//  SlapChat
//
//  Created by Ian Rahman on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let store = DataStore.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        store.fetchData()
        //generateTestData()
        print(store.messages)
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        store.fetchData()
        self.tableView.reloadData()
    }
    
//    func generateTestData() {
//        store.messages.removeAll()
//        let context = store.persistentContainer.viewContext
//        let date = Date()
//        let message1 = Message(context: context)
//        let message2 = Message(context: context)
//        message1.content = "Hello"
//        message1.createdAt = date as NSDate?
//        message2.content = "World"
//        message2.createdAt = date as NSDate?
//        store.saveContext()
//        store.fetchData()
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.messages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath)
        cell.textLabel?.text = store.messages[indexPath.row].content
        return cell
    }
    @IBAction func reorderButtonTapped(_ sender: Any) {
        store.messages.sort(by: { first, second in
            
            switch first.createdAt!.compare(second.createdAt! as Date) {
                
            case .orderedAscending:
                return false
            case .orderedDescending:
                return true
            case .orderedSame:
                return true
            }
        })
        self.tableView.reloadData()

    }
    
    
}
