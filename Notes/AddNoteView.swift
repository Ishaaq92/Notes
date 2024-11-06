//
//  AddNoteView.swift
//  Notes
//
//  Created by Ishaaq Ahmed on 04/11/2024.
//

import SwiftUI

struct AddNoteView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = ""
    @State private var text: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    TextField("Title", text: $title)
                    TextField("Text", text: $text)
                }
                
                Section {
                    Button("Save Note"){
                        let note = Note(context: moc)
                        note.id = UUID()
                        note.title = title
                        note.text = text
                        
                        try? moc.save()
                        dismiss()
                    }
                }
            }
            .navigationTitle("New Note")
            
        }
    }
}

#Preview {
    AddNoteView()
}
