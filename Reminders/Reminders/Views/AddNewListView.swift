//
//  AddNewListView.swift
//  Reminders
//
//  Created by Sravya Kaki on 5/13/25.
//

import SwiftUI

struct AddNewListView: View {
    
  @ObservedObject private var vm: AddNewListViewModel
  @Environment(\.presentationMode) var presentationMode
    
    init(vm: AddNewListViewModel) {
        self.vm = vm
    }
    
    var body: some View {
        Form {
            VStack(alignment: .leading) {
                Text("New List")
                    .font(.headline)
                    .padding(.bottom, 20)
                
                HStack {
                    Text("Name:")
                    TextField("", text: $vm.name)
                }
                HStack {
                    Text("Color:")
                    ColorListView(selectedColor: $vm.color)
                }
            }
            HStack {
                Spacer()
                Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }
                Button("Ok") {
                    vm.save()
                    presentationMode.wrappedValue.dismiss()
                }.disabled(vm.name.isEmpty)
            }
        }
        .frame(minWidth: 300)
        .padding()
    }
}

#Preview {
    let viewContext = CoreDataManager.shared.persistentContainer.viewContext
    AddNewListView(vm: AddNewListViewModel(context: viewContext))
}
