//
//  ColorListView.swift
//  Reminders
//
//  Created by Sravya Kaki on 5/14/25.
//

import SwiftUI

struct ColorListView: View {
    
    let colors = [Color.red, Color.orange, Color.green, Color.blue, Color.purple]
    @Binding var selectedColor: Color
    
    var body: some View {
        HStack {
            ForEach(colors, id:\.self) { color in
            
                Image(systemName: selectedColor == color ?  Constants.Icons.recordCircleFill : Constants.Icons.circleFill)
                    .foregroundColor(color)
                    .font(.system(size: 16))
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedColor = color
                    }
            }
        }
    }
}

#Preview {
    ColorListView(selectedColor: .constant(.blue))
}
