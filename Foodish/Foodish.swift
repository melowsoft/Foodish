//
//  Foodish.swift
//  Foodish
//
//  Created by Tony on 02/02/2022.
//

import Foundation

struct Foodish {
  private(set) var foods: Array<Food>
    
    func addToCart(_ food: Food) {
        
    }
    
    init() {
       foods = []
    }
    
    struct Food: Identifiable {
        var id = UUID()
        var name: String
        var price: Double
        var images: Array<String>
        var deliveryInfo: String
    }
}
