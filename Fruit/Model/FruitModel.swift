//
//  FruitModel.swift
//  Fruit
//
//  Created by Ted Butler on 2/24/22.
//

import SwiftUI


// MARK: - FRUIT DATA MODEL

struct Fruit: Identifiable{
    let id = UUID()
    var title:String
    var headline:String
    var image:String
    var gradientColors:[Color]
    var description:String
    var nutrition:[String]
    
}
