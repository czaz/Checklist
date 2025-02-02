//
//  RowView.swift
//  Checklist
//
//  Created by Wm. Zazeckie on 1/24/21.
//

import SwiftUI



struct RowView: View {
    
    @Binding var checklistItem: ChecklistItem
    
    var body: some View {
        NavigationLink(destination: EditChecklistItemView(checklistItem: $checklistItem)){
            HStack{
                Text(checklistItem.name)
                Spacer()
                Text(checklistItem.isChecked ? "✅" : "⏹")
            }
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(checklistItem: .constant(ChecklistItem(name: "Sample item")))
    }
}
