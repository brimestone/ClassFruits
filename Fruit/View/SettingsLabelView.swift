//
//  SettingsLabelView.swift
//  Fruit
//
//  Created by Ted Butler on 2/25/22.
//

import SwiftUI

struct SettingsLabelView: View {
    // MARK: - PROPERTIES
    
    var labelText:String
    var labelImage:String
    
    // MARK: - BODY
    
    // MARK: - PREVIEW
    
    var body: some View {
        HStack {
            Text(labelText.uppercased())
                .fontWeight(.bold)
            Spacer()
            Image(systemName: labelImage)
        }
    }
}

struct SettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView(labelText: "fruits", labelImage: "info.circle")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
