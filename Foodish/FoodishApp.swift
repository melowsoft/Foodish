//
//  FoodishApp.swift
//  Foodish
//
//  Created by Tony on 01/02/2022.
//

import SwiftUI
import Firebase

@main
struct FoodishApp: App {
    
    init() {
        FirebaseApp.configure()
    }
   
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

