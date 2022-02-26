//
//  ContentView.swift
//  Fruit
//
//  Created by Ted Butler on 2/24/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    var fruits:[Fruit] = fruitData
    @State private var isShowingSettings:Bool = false
    
    
    // MARK: - BODY
    var body: some View {
        NavigationView{
            List{
                ForEach(fruits.shuffled()){ fruit in
                    NavigationLink(destination: FruitDetailView(fruit: fruit)){
                        FruitRowView(fruit: fruit)
                            .padding(.vertical, 4)
                    }
                    
                }
            }
            .navigationTitle("Fruits")
            .navigationBarItems(
                trailing:
                Button(action: {
                    isShowingSettings = true
                }, label: {
                    Image(systemName: "slider.horizontal.3")
                }) //: BUTTON
                .sheet(isPresented: $isShowingSettings){
                    SettingsView()
                }
            )
        } //: NAVIGATION
        
    }
}


// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitData)
    }
}
