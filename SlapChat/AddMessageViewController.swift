//
//  ViewController.swift
//  SlapChat
//
//  Created by susan lovaglio on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class AddMessageViewController: UIViewController {

    @IBOutlet weak var addMessageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func saveMessageButtonTapped(_ sender: AnyObject) {
        
        var store = DataStore()
        let newMessage = NSEntityDescription.insertNewObject(forEntityName: "Message", into: store.managedObjectContext) as! Message
        newMessage.content = addMessageTextField.text
        newMessage.createdAt = Date()
        store.saveContext()
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func cancelButtonTapped(_ sender: AnyObject) {
        
        dismiss(animated: true, completion: nil)
    }
}

