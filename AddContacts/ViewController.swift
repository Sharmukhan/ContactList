//
//  ViewController.swift
//  AddContacts
//
//  Created by Kymbat Sharmukhan on 16.01.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    @IBAction func SaveButton(_ sender: Any) {
      
        let defaults = UserDefaults.standard
        let name = nameTextField.text!
       // let surname = surnameTextField.text!
        let phoneNumber = phoneNumberTextField.text!
        
        var newContact = Contacts()
        newContact.name = name
        newContact.phoneNumber = phoneNumber
        
        do {
            if let data = defaults.data(forKey: "contactsItemArray") {
                var array = try JSONDecoder().decode([Contacts].self, from: data)
                array.append(newContact)
                
                let encodedata = try JSONEncoder().encode(array)
                defaults.set(encodedata, forKey: "contactsItemArray")
                
            } else {
                let encodedata = try JSONEncoder().encode([newContact])
                defaults.set(encodedata, forKey: "contactsItemArray")
            }
        } catch {
        print("unable to encode \(error)")
    }
        
        nameTextField.text = ""
      //  surnameTextField.text = ""
        phoneNumberTextField.text = ""
        
    }
    
}

