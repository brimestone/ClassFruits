//
//  SettingsRowView.swift
//  Fruit
//
//  Created by Ted Butler on 2/26/22.
//

import SwiftUI

struct SettingsRowView: View {
    // MARK: - PROPERTIES
    var name:String
    var content:String?
    var linkLabel:String? = nil
    var linkDestination:String? = nil
    
    
    // MARK: - BODY
    var body: some View {
        Divider().padding(.vertical, 4)
        HStack{
            Text(name).foregroundColor(.gray)
            Spacer()
            if let _content = content {
                Text(_content)
            }else{
                if let _linkLabel = linkLabel, let _linkDestination = linkDestination {
                    Link(_linkLabel, destination: URL(string: _linkDestination)!)
                    Image(systemName: "arrow.up.right.square").foregroundColor(.orange)
                }
            }
        }
    }
}


// MARK: - PREVIEW
struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(name: "Developer", content: "Ted Butler")
            .previewLayout(.sizeThatFits)
            .padding()
        
        SettingsRowView(name: "Twitter", linkLabel: "@__kernel_panic__", linkDestination: "https://twitter.com/__kernel_panic__")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
