//
//  FruitRowView.swift
//  Fruit
//
//  Created by Ted Butler on 2/24/22.
//

import SwiftUI

struct FruitRowView: View {
    // MARK: - PROPERTIES
    
    @AppStorage("isOnboarding") var isOnboarding:Bool?
    
    var fruit:Fruit
    
    // MARK: - BODY
    
    var body: some View {
        HStack{
            Image(fruit.image)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80, alignment: .center)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 3, x: 2, y: 2)
                .background(
                    LinearGradient(gradient: Gradient(colors: fruit.gradientColors), startPoint: .top, endPoint: .bottom)
                )
                .cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
         
            VStack(alignment: .leading, spacing: 5){
                Text(fruit.title)
                    .font(.title3)
                    .fontWeight(.bold)
                Text(fruit.headline)
                    .font(.caption)
                    .foregroundColor(Color.secondary)
            }
            
        }
    }
}








// MARK: - Preview
struct FruitRowView_Previews: PreviewProvider {
    static var previews: some View {
        FruitRowView(fruit: fruitData[0])
            .previewLayout(.sizeThatFits)
            .padding()
        
    }
}
