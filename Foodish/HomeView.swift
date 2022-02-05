//
//  HomeView.swift
//  Foodish
//
//  Created by Tony on 02/02/2022.
//

import SwiftUI

struct HomeView: View {
    @StateObject var foodManager = FoodManager()
    @State var searchTerm: String = ""
    @State var activeMenu: String = "foods"
    
    private let generator = UISelectionFeedbackGenerator()
    
    var body: some View {
        ZStack {
            Color(HomeViewConstant.backgroundColor)
            VStack {
                VStack(spacing: 40) {
                    HStack {
                        Image(systemName: "text.alignleft")
                            .font(.system(size: 22))
                            .foregroundColor(Color.black.opacity(0.8))
                        Spacer()
                        Image(systemName: "cart")
                            .font(.system(size: 22))
                            .foregroundColor(Color.black.opacity(0.4))
                        
                    }
                    
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Delicious")
                                .frame(height: 30)
                            
                            Text("food for you")
                                .frame(height: 30)
                        }
                        .font(.system(.largeTitle, design: .rounded).bold())
                        .foregroundColor(Color.black)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                        TextField("Search", text: $searchTerm){ editing in
                            generator.selectionChanged()
                        }
                            .foregroundColor(Color.black)
                            .autocapitalization(.none)
                    }
                    .padding()
                    .frame(height: 60)
                    .background(Color(HomeViewConstant.splashColor))
                    .cornerRadius(30)
                    
                }
                .padding(.trailing, 40)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        VStack {
                            Text("Foods")
                                .font(.body)
                                .foregroundColor(activeMenu == "foods" ? Color(HomeViewConstant.activeColor) : Color.black)
                                .bold()
                            Color(activeMenu == "foods" ? HomeViewConstant.activeColor : .white)
                                .frame(height: 3)
                                .cornerRadius(40)
                                .animation(.easeInOut)
                        }
                        
                        VStack {
                            Text("Drinks")
                                .font(.body)
                                .foregroundColor(.black)
                                .bold()
                            Color(activeMenu == "drinks" ? HomeViewConstant.activeColor : HomeViewConstant.backgroundColor)
                                .frame(height: 3)
                                .cornerRadius(40)
                                .animation(.easeInOut)
                        }
                        
                        VStack {
                            Text("Snacks")
                                .font(.body)
                                .foregroundColor(.black)
                                .bold()
                            Color(activeMenu == "snacks" ? HomeViewConstant.activeColor : HomeViewConstant.backgroundColor)
                                .frame(height: 3)
                                .cornerRadius(40)
                                .animation(.easeInOut)
                        }
                        
                        VStack {
                            Text("Sauce")
                                .font(.body)
                                .foregroundColor(.black)
                                .bold()
                            Color(activeMenu == "sauce" ? HomeViewConstant.activeColor : HomeViewConstant.backgroundColor)
                                .frame(height: 3)
                                .cornerRadius(40)
                                .animation(.easeInOut)
                        }
                    }
                    
                }
                .padding(.top, 30)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    Spacer()
                    HStack(spacing: 30) {
                        ForEach(foodManager.foods, id: \.id) { food in
                            FoodCard(food: food)
                        }
                        
                        Spacer()
                    }
                    
                    Spacer()
                }
       
                
                Spacer()
            }
            .padding(.leading, 40)
            .padding(.top, 50)
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    private struct HomeViewConstant {
        static let backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        static let splashColor = #colorLiteral(red: 0.937254902, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        static let activeColor = #colorLiteral(red: 1, green: 0.2941176471, blue: 0.2274509804, alpha: 1)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct Food: Identifiable, Decodable {
    var id: String
    var name: String
    var price: Float
    var images: Array<String>
    var deliveryInfo: String
    var createdAt: Date
}

let foods: Array<Food> = [
    Food(id: "dfhgjklkhjgdas", name: "Veggie tomato mix", price: 1900.0, images: ["dish-1"], deliveryInfo: "", createdAt: Date()),
    Food(id: "jhgfkhjsdfkjdsa", name: "Jollof rice and Plantain", price: 2000.0, images: ["dish-2"], deliveryInfo: "", createdAt: Date())
   ]
