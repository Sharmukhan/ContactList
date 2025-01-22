//
//  DetailViewController.swift
//  AddContacts
//
//  Created by Kymbat Sharmukhan on 16.01.2025.
//

import UIKit

class DetailViewController: UIViewController {
    var name = ""
    var phoneNumber = ""
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    
    @IBOutlet weak var nameTextFieldChange: UITextField!
    
    @IBOutlet weak var phoneTextFieldChange: UITextField!
    
    var contact: Contacts?
       var onSave: ((Contacts) -> Void)?
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = name
        phoneNumberLabel.text = phoneNumber
        // Do any additional setup after loading the view.
        
        nameTextFieldChange.text = contact?.name
        phoneTextFieldChange.text = contact?.phoneNumber
    }
    

    @IBAction func changeButton(_ sender: Any) {
        
        guard let name = nameTextFieldChange.text, !name.isEmpty,
              let phone = phoneTextFieldChange.text, !phone.isEmpty else {
                    
                    return
                }
        
        contact?.name = name
        contact?.phoneNumber = phone
               
               if let updatedContact = contact {
                   onSave?(updatedContact)
               }
               
               navigationController?.popViewController(animated: true) // Вернуться назад
           }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
