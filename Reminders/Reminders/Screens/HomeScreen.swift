//
//  HomeScreen.swift
//  Reminders
//
//  Created by Sravya Kaki on 5/13/25.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationView {
            SideBarView()
            Text("Content")
        }
    }
}

#Preview {
    HomeScreen()
}
