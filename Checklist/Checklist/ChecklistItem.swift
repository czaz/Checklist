//
//  ChecklistItem.swift
//  Checklist
//
//  Created by Wm. Zazeckie on 1/24/21.
//

import Foundation

struct ChecklistItem : Identifiable, Codable{
    let id = UUID()
    var name: String
    var isChecked: Bool = false
}
