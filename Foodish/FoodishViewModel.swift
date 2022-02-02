//
//  FoodishViewModel.swift
//  Foodish
//
//  Created by Tony on 02/02/2022.
//

import SwiftUI

class FoodishViewModel: ObservableObject {
  private var model: Foodish = Foodish()
    
    var foods: Array<Foodish.Food> {
        return model.foods
    }
}
