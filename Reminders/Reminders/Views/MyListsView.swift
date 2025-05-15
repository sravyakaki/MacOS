//
//  MyListsView.swift
//  Reminders
//
//  Created by Sravya Kaki on 5/14/25.
//

import SwiftUI

struct MyListsView: View {
    
   @ObservedObject var vm: MyListsViewModel
    
    init(vm: MyListsViewModel) {
        self.vm = vm
    }
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            List {
                Text("My Lists")
                ForEach(vm.myLists) { myList in
                    HStack {
                        Image(systemName: Constants.Icons.line3HorizontalCircleFill)
                            .font(.title)
                            .foregroundColor(myList.color)
                        Text(myList.name)
                    }
                    
                }
               
            }
            
        }
    }
}

#Preview {
    
    let viewContext = CoreDataManager.shared.persistentContainer.viewContext
    MyListsView(vm: MyListsViewModel(context: viewContext))
}
 
