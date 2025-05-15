//
//  SideBarView.swift
//  Reminders
//
//  Created by Sravya Kaki on 5/13/25.
//

import SwiftUI

struct SideBarView: View {
    
    @State private var isPresented: Bool = false
    @Environment(\.managedObjectContext) var context: NSManagedObjectContext
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("All items count 10")
            
            MyListsView(vm: MyListsViewModel(context: context))
            
            Spacer()
            
            Button {
                isPresented = true
            } label: {
                HStack {
                    Image(systemName: Constants.Icons.plusCircle)
                    Text("Add List")
                }
            }.buttonStyle(.plain)
                .padding()
        }.sheet(isPresented: $isPresented) {
            AddNewListView(vm: AddNewListViewModel(context: context))
        }
        
    }
}

#Preview {
    SideBarView()
}
