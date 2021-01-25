//
//  EditChecklistItemView.swift
//  Checklist
//
//  Created by Wm. Zazeckie on 1/24/21.
//

import SwiftUI

struct EditChecklistItemView: View {
    
    // Properties
    // ==========
    
    @Binding var checklistItem: ChecklistItem
    
    var body: some View {
        Form {
            TextField("Name" , text:  $checklistItem.name)
            Toggle("Completed", isOn: $checklistItem.isChecked)
        }
    }
}

// Preview
// =======

struct EditChecklistItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditChecklistItemView(checklistItem: .constant(ChecklistItem(name: "Sample item")))
    }
}
