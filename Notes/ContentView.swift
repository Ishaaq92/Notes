//
//  ContentView.swift
//  Notes
//
//  Created by Ishaaq Ahmed on 04/11/2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors:  [] ) var notes: FetchedResults<Note>
    
    @State private var showingAddNoteView: Bool = false
    @State private var searchText = ""
    var body: some View {
        NavigationView {
            VStack{
                
                List {
                    ForEach(notes, id: \.id) { note in
                        NavigationLink{
                            NoteDetailView(note: note)
                            
                        } label: {
                            VStack(alignment: .leading) {
                                 Text(note.title ?? "Untitled")
                                     .font(.headline)
                                 Text(note.text ?? "No content")
                                     .font(.subheadline)
                                     .foregroundColor(.secondary)
                            }
                        }
                    }
                    .onDelete(perform: deleteNote)
                }
                
                Text("Total Notes: \(notes.count)")
                    .padding(.top)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
            }
            .navigationTitle("My Notes")
            .searchable(text: $searchText)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add", systemImage: "plus") {
                        showingAddNoteView.toggle()
                    }
                }
            }
            .sheet(isPresented: $showingAddNoteView){
                AddNoteView()
                    .environment(\.managedObjectContext, moc)
            }
            .onAppear {
                // Assign UUID to notes missing an ID
                for note in notes where note.id == nil {
                    note.id = UUID()
                }
                try? moc.save() // Save changes to the context
            }
        }
    }
    
    private func deleteNote(at offsets: IndexSet) {
        for index in offsets {
            let note = notes[index]
            moc.delete(note)
        }
        try? moc.save() // Save context after deletion
    }
    
}

#Preview {
    ContentView()
}
