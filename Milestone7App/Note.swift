//
//  Note.swift
//  Notes
//
//  Created by Simon Italia on 1/20/19.
//  Copyright © 2019 SDI Group Inc. All rights reserved.
//

import Foundation

struct Note: Codable {
    
    //Model properties
    var detail: String
    
    //Logic to handle reading and writing Model data to disck
    //Get Directory path
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    //
    static let ArchiveUrl = DocumentsDirectory.appendingPathComponent("notes")
        .appendingPathExtension("plist")
    
    //Save Note data to disk method
    static func saveNotes(_ notes: [Note]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedNotes = try? propertyListEncoder.encode(notes)
        try? codedNotes?.write(to: ArchiveUrl, options: .noFileProtection)
    }
    
    //Load Note data from disk methdod
    static func loadNotes() -> [Note]? {
        guard let codedNotes = try? Data(contentsOf: ArchiveUrl) else {return nil}
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<Note>.self, from: codedNotes)
    }
}

