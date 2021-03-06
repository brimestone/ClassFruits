//
//  FruitApp.swift
//  Fruit
//
//  Created by Ted Butler on 2/24/22.
//

import SwiftUI

@main
struct FruitApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @AppStorage("isOnboarding") var isOnboarding:Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
            }else{
                ContentView()
            }
        }
    }
}
