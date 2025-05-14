//
//  SideBarView.swift
//  Reminders
//
//  Created by Sravya Kaki on 5/13/25.
//

import SwiftUI

struct SideBarView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("All items count 10")
            
            List(1...5, id: \.self) { index in
                Text("List \(index)")
            }
            Spacer()
            
            Button("Add List") {
                
            }
        }
    }
}

#Preview {
    SideBarView()
}
