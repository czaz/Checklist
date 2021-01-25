//
//  ContentView.swift
//  Checklist
//
//  Created by Wm. Zazeckie on 1/23/21.
//

import SwiftUI

struct ChecklistItem : Identifiable{
    let id = UUID()
    var name: String
    var isChecked: Bool = false
}

struct ChecklistView: View {
    
   // Properties
  // ===========
    
   @State var checklistItems = [
    ChecklistItem(name: "Walk the dog", isChecked: false),
    ChecklistItem(name: "Brush my teeth", isChecked: false),
    ChecklistItem(name: "Learn iOS development", isChecked: true),
    ChecklistItem(name: "Soccer practice", isChecked: false),
    ChecklistItem(name: "Take vocal lessons", isChecked: true),
    

   ]
    
    // User interface content and layout
    var body: some View {
        NavigationView{
            List{
                ForEach(checklistItems) {checklistItem in
                    
                    HStack {
                        
                        Text(checklistItem.name)
                        
                        Spacer()
                        
                        Text(checklistItem.isChecked ? "✅": "⏹")
                        
                    }
                    .background(Color.white) // This makes the entire row clickable
                    .onTapGesture {
                        if let matchingIndex = self.checklistItems.firstIndex(where: {
                            $0.id == checklistItem.id })
                        {
                            
                            self.checklistItems[matchingIndex].isChecked.toggle()
                    }
                        self.printChecklistContents()
                }
                }
            
                .onDelete(perform: deleteListItem)
                .onMove(perform: moveListItem)
                
        }
        .navigationBarItems(trailing: EditButton())
        .navigationBarTitle("Checklist")
        .onAppear(){
            self.printChecklistContents()
        }
    }
}

    // Methods
    // =======
    
    func printChecklistContents(){
        for item in checklistItems{
            print(item)
        }
    }
    
    func deleteListItem(whichElement: IndexSet) {
        checklistItems.remove(atOffsets: whichElement)
        printChecklistContents()
    }
    
    func moveListItem(whichElement: IndexSet, destination: Int){
        checklistItems.move(fromOffsets: whichElement, toOffset: destination)
        printChecklistContents()
    }
    
// Preview
// =======
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
}
