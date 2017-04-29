//
//  NoteTableViewController.swift
//  NoteKeeper
//
//  Created by Reza Purnama Arief on 06/02/2017.
//  Copyright © 2017 Reza Purnama Arief. All rights reserved.
//

import UIKit

class NoteTableViewController: UITableViewController {

    enum noteTitle {
        case NEW
        case EDIT
    }
    
    var plist = UserDefaults.standard
    var notes: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Note keepah!"
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        plist.synchronize()
        if let note = plist.value(forKey: "notes") as? [String] {
            notes = note
        }
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return notes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //return Cell using UITableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = notes[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        performSegue(withIdentifier: "editNoteSegue", sender: nil)
    }

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destinationViewController.
        if segue.identifier == "editNoteSegue" {
            
            let destination = segue.destination as! ViewController
            let indexPath = tableView.indexPathForSelectedRow!
            
            // Pass the selected object to the new view controller.
            destination.title = String (describing: noteTitle.EDIT)
            destination.indexPath = indexPath.row
            destination.editNote = notes[indexPath.row]
            destination.note = notes[indexPath.row]
        }
    }
    


}
