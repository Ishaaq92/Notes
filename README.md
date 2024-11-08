This project was an introduction to CoreData which is how we store data from our app persistantly through secondary storage. In this case I created a note entity to store 3 attributes. id, title and text. Each note has these three attributes which are of type UUID, String and String respectively.

This was done by:

1. **Creating a Note entity.**
   Created a new file called 'Notes.xcdatamodeld' where I created the Note entity with all its attributes
2. **Created a Data Controller**
   Created another new file called 'DataController.swift' where I used the NSPersistantContainer to load the Note entity for us to use in the app.
3. **Creating the Managed Object Context variable**
   Created this variable to save changed to secondary storage using '_moc.save_'.
