//
//  DetailViewController.swift
//  Notes
//
//  Created by Simon Italia on 1/20/19.
//  Copyright © 2019 SDI Group Inc. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextViewDelegate {
    
    //Property to store note object data passed from mainVC to this DetailVC
    var note: Note?
    
    //Text View outlets
    @IBOutlet weak var detailTextView: UITextView!
    
    //Navigation Bar items.
    @IBOutlet weak var saveButton: UIBarButtonItem!
        //Static property to handle enable/disable state of save button
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set TextView text to note object if one is passed from VC
        if let note = note {
            title = "Edit note"
            detailTextView.text = note.detail
        } else {
            title = "Add note"
        }
        
        //Set DetailVC as the delegate for the TextView so user edits can be detected
        detailTextView.delegate = self
        
        //Set Save Button state
        updateSaveButtonState()
        
        //Adjust for Keyboard to prevent text entered in TextView falling behind KB
        let notificationCenter = NotificationCenter.default
            //Subscribe to notificationCenter
        
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name:
            UIResponder.keyboardWillHideNotification, object: nil)
        
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name:
            UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
    } //End of viewDidLoad() method
    
    //Detect when user edits text in TextView (this method is built in, provided by UITextViewDelegate() protocol)
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text)
        updateSaveButtonState()
    }
    
    //Method to update Save Button state if text present or not in TextView
    func updateSaveButtonState() {
        let detailText = detailTextView.text ?? ""
        saveButton.isEnabled = !detailText.isEmpty
    }
    
    //Create Note data object (detail data) in readiness to pass back to DetailVC. Note Data object stored inside segue object
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveUnwind" else { return }
        
        //Create a data object from data entered by user in DetailVC
        let detailText = detailTextView.text!
        
        //Set note object property to the data object created above
        note = Note(detail: detailText)
    }
    
    //adjustForKeyboard() method
    @objc func adjustForKeyboard(notification: Notification) {
        let userInfo = notification.userInfo!
        
        let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            detailTextView.contentInset = UIEdgeInsets.zero
            
        } else {
            
            detailTextView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height, right: 0)
        }
        
        detailTextView.scrollIndicatorInsets = detailTextView.contentInset
        
        let selectedRange = detailTextView.selectedRange
        detailTextView.scrollRangeToVisible(selectedRange)
    
    } //End adjustForKeyboard() method

}
