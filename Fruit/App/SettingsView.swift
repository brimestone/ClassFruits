//
//  SettingsView.swift
//  Fruit
//
//  Created by Ted Butler on 2/25/22.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    
    @AppStorage("isOnboarding") var isOnboarding:Bool = false
    
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 20) {
                    // MARK: - SECTION 1
                    GroupBox(
                        label:
                            SettingsLabelView(labelText: "fruits", labelImage: "info.circle")
                        ){
                            Divider().padding(.vertical, 4)
                            
                            HStack(alignment: .center, spacing: 10) {
                                Image("logo")
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(10)
                                    .frame(width: 80, height: 80)
                                
                                Text("Must fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins and much more.")
                                    .font(.footnote)
                                    .frame(alignment: .top)
                            }
                        }
                    
                    // MARK: - SECTION 2
                    GroupBox(
                        label: SettingsLabelView(labelText: "Settings", labelImage: "gearshape")
                    ){
                        Divider().padding(.vertical, 4)
                        Text("By clicking on the reset button, the application will reinitialized which will send your session back to onboarding.")
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        Spacer(minLength: 20)
                        Button {
                            dismiss()
                            isOnboarding = true
                        } label: {
                            Text("RESET")
                        }
                        .foregroundColor(.blue)
                    }
                    
                    // MARK: - SECTION 3
                    GroupBox(
                        label: SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
                    ){
                        SettingsRowView(name: "Developer", content: "Ted Butler")
                        SettingsRowView(name: "Twitter", linkLabel: "@_kernel_panik_", linkDestination: "https://twitter.com/_kernel_panik_")
                        SettingsRowView(name: "Github", linkLabel: "brimestone", linkDestination: "https://github.com/brimestone")
                        
                    } //: BOX
                    
                    
                } //: VSTACK
            } //: SCROLLVIEW
            .navigationBarTitle(Text("Settings"), displayMode: .large)
            .navigationBarItems(
                trailing:
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                    })
            )
            .padding()
            
            
            
        } //: NAVIGATION
        
        
        
    }
}

// MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
