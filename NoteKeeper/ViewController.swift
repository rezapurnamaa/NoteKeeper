//
//  ViewController.swift
//  NoteKeeper
//
//  Created by Reza Purnama Arief on 06/02/2017.
//  Copyright © 2017 Reza Purnama Arief. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate {

    let plist = UserDefaults.standard
    var note: String?
    var editNote: String?
    var indexPath: Int?
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTitle()
        
        navigationController?.delegate = self
        
        if (note != nil) {
            textView.text = note
        }
        else {
            textView.text = ""
        }
    }

    func updateTitle() {
        if title == nil {
            title = "NEW"
        }
    }

    // MARK: - Navigation
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        if let controller = viewController as? NoteTableViewController {
            
            //if tableViewCell is clicked to edit note
            if editNote != nil {
                controller.notes[indexPath!] = textView.text
            } else {
                controller.notes.append(textView.text)
            }
            
            //save to property list mtfkr
            plist.set(controller.notes, forKey: "notes")
            
        }
    }
    
}

