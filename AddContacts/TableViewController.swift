//
//  TableViewController.swift
//  AddContacts
//
//  Created by Kymbat Sharmukhan on 16.01.2025.
//

import UIKit

class TableViewController: UITableViewController {
    
    var contacts: [Contacts] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
        let defaults = UserDefaults.standard
        
        
        do {
            if let data = defaults.data(forKey: "contactsItemArray") {
                let array = try JSONDecoder().decode([Contacts].self, from: data)
                contacts = array
            }
        } catch {
        print("unable to encode \(error)")
    }
        
        tableView.reloadData()
    }
    
    func saveContacts() {
   
       let defaults = UserDefaults.standard
        
        
        do {
     
            let encodedata = try JSONEncoder().encode(contacts)
                defaults.set(encodedata, forKey: "contactsItemArray")
            
        } catch {
        print("unable to encode \(error)")
    }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contacts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "cell")
        
        cell.textLabel?.text = contacts[indexPath.row].name
        cell.detailTextLabel?.text = contacts[indexPath.row].phoneNumber
        
     //   if contacts[indexPath.row].isSelected {
            cell.accessoryType = .disclosureIndicator
     //   } else {
     //       cell.accessoryType = .none
    //    }
        

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            contacts.remove(at: indexPath.row)
            saveContacts()
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        contacts[indexPath.row].isSelected.toggle()
        
        let details = storyboard?.instantiateViewController(identifier: "details") as! DetailViewController
        details.name = contacts[indexPath.row].name
        details.phoneNumber = contacts[indexPath.row].phoneNumber
        navigationController?.show(details, sender: self)
        
        
        
        tableView.reloadData()
        saveContacts()
        
        
    }
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
