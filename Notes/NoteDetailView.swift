//
//  NoteDetailView.swift
//  Notes
//
//  Created by Ishaaq Ahmed on 04/11/2024.
//

import SwiftUI

struct NoteDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var note : Note
    
    @State private var title: String
    @State private var text: String
    
    @State private var Done: Bool = false
    
    init(note: Note) {
        self.note = note
        _title = State(initialValue: note.title ?? "")
        _text = State(initialValue: note.text ?? "")
    }
    
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    TextField("title", text: $title)
                    TextField("text", text: $text)
                }
                
                Section {
                    Button("Save Note"){
                        note.title = title
                        note.text = text
                        try? moc.save()
                        dismiss()
                    }
                }
            }
            .navigationTitle("Edit Note")
            
        }
    }

}

#Preview {
    //NoteDetailView()
}
