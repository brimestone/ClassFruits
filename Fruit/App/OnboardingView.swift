//
//  OnboardingView.swift
//  Fruit
//
//  Created by Ted Butler on 2/24/22.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTIES
    
    var fruits:[Fruit] = fruitData
    
    // MARK: - BODY
    
    var body: some View {
        TabView{
            ForEach(fruits[0...5]){ fruit in
                FruitCardView(fruit: fruit)
            } //: LOOP
            
        } //: TAB
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
        
    }
}

// MARK: - PREVIEW
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(fruits: fruitData)
    }
}
