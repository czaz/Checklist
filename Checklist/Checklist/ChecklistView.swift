//
//  ContentView.swift
//  Checklist
//
//  Created by Wm. Zazeckie on 1/23/21.
//

import SwiftUI


struct ChecklistView: View {
    
   // Properties
  // ===========
    @State var newChecklistItemViewIsVisible = false
    @ObservedObject var checklist = Checklist()
    
    // User interface content and layout
    var body: some View {
        
        NavigationView {
            
            List{
                ForEach(checklist.items) {index in
                    RowView(checklistItem:  self.$checklist.items[index])
                    
                    }
            
                .onDelete(perform: checklist.deleteListItem)
                .onMove(perform: checklist.moveListItem)
                
        }
        .navigationBarItems(
            
            leading: Button(action: { self.newChecklistItemViewIsVisible = true}){
                HStack{
                    Image(systemName: "plus.circle.fill")
                    Text("Add item")
                }
                
            },
            trailing: EditButton()
        
        
        
        )
        .navigationBarTitle("Checklist", displayMode: .inline)
        .onAppear(){
            self.checklist.printChecklistContents()
            self.checklist.saveListItems()
            
        }
    }
        .sheet(isPresented: $newChecklistItemViewIsVisible){
            NewChecklistItemView(checklist: self.checklist)
        }
        
}
}
    
    // Methods
    // =======

    
// Preview
// =======
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView()
    }
}
   
    

