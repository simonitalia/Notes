//
//  ViewController.swift
//  Notes
//
//  Created by Simon Italia on 1/20/19.
//  Copyright © 2019 SDI Group Inc. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var notes = [Note]()
    
    //Property to store note object passed back to this VC from DetailVC
    var note: Note?
    
    //Segue to return user back to main VC from DetailVC on cancel or receive a new or modified note data object back, via Segue
    @IBAction func unwindToNotesList(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind" else { return }
        let sourceViewController = segue.source as! DetailViewController

        //If note object passed back is an update to pre-existing note object, update note object row with updated data
        if let note = sourceViewController.note {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                notes[selectedIndexPath.row] = note
                tableView.reloadRows(at: [selectedIndexPath], with: .none)

            //Else insert a new note object row
            } else {
                let newIndexPath = IndexPath(row: notes.count, section: 0)
                notes.append(note)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }

        //Call the saveNotes() method to save note data to disk
        Note.saveNotes(notes)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Set navigation bar title
        title = "Notes"
        
        //Enable select row item delete (Edit) button in navigaton bar
        navigationItem.leftBarButtonItem = editButtonItem
        
        //Load any saved data from disk
        if let savedNotes = Note.loadNotes() {
            notes = savedNotes
        } else {
            return
        }
        
    } //End viewDidLoad() method
    
    //Set number of rows to show on app load, based on existing number of note/s
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
        
    }

    //Create cell data items from Note object
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell") else { fatalError("Could not dequeue cell") }
        
        let note = notes[indexPath.row]
        cell.textLabel?.text = note.detail
        return cell
    }
    
    //Pass note object of row tapped to Detail VC for editing, via destination / DetailVC note property
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let detailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as?
            DetailViewController {
            
            detailViewController.note = notes[indexPath.row]
            
            navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
    
    //Enable swipe to delete per row item
    override func tableView(_ tableView: UITableView, canEditRowAt
        indexPath: IndexPath) -> Bool {
        return true
    }
    
    //Delete row item swiped by user
    override func tableView(_ tableView: UITableView, commit
        editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath:
        IndexPath) {
        if editingStyle == .delete {
            notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            //Call saveNotes() method to update the data saved on disk
            Note.saveNotes(notes)
        }
    }
}
