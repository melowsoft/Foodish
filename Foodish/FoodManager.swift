//
//  FoodManager.swift
//  Foodish
//
//  Created by Tony on 05/02/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class FoodManager: ObservableObject {
    @Published private(set) var foods: [Food] = []
    let db = Firestore.firestore()
    
    init(){
        getFoods()
    }
    
    func getFoods(){
        db.collection("foods").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(String(describing: error))")
                return
            }
            
            self.foods = documents.compactMap { document -> Food? in
                print("\(documents) foods here")
                do {
                    return try document.data(as: Food.self)
                } catch {
                    print("Error decoding document into Food: \(error)")
                    return nil
                }
            }
        }
    }
    
}
