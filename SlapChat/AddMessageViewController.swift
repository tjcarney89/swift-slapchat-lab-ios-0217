//
//  AddMessageViewController.swift
//  SlapChat
//
//  Created by TJ Carney on 3/15/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit

class AddMessageViewController: UIViewController {
    
    @IBOutlet weak var newMessageTextField: UITextField!
    
    let store = DataStore.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        let context = store.persistentContainer.viewContext
        let date = Date()
        let message1 = Message(context: context)
        if let newMessage = newMessageTextField.text {
            message1.content = newMessage
            message1.createdAt = date as NSDate?
        }
        store.saveContext()
        self.dismiss(animated: true, completion: nil)
        
    }


}
