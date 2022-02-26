//
//  FruitNutrientsView.swift
//  Fruit
//
//  Created by Ted Butler on 2/25/22.
//

import SwiftUI

struct FruitNutrientsView: View {
    // MARK: - PROPERTIES
    
    var fruit:Fruit
    let nutrients:[String] = ["Energy", "Sugar", "Fat", "Protien", "Vitamins", "Minirals"]
    
    // MARK: - BODY
    var body: some View {
        GroupBox{
            DisclosureGroup("Nutritional value per 100g"){
                ForEach(0 ..< nutrients.count, id: \.self) { item in
                    Divider()
                        .padding(.vertical, 2)
                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                            Text(nutrients[item])
                        }
                        .foregroundColor(fruit.gradientColors[1])
                        Spacer(minLength: 25)
                        Text(fruit.nutrition[item])
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
        }
        
    }
}


// MARK: - PREVIEW
struct FruitNutrientsView_Previews: PreviewProvider {
    static var previews: some View {
        FruitNutrientsView(fruit: fruitData[0])
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 375, height: 480))
            .padding()
    }
}
