//
//  HomeView.swift
//  Foodish
//
//  Created by Tony on 02/02/2022.
//

import SwiftUI

struct HomeView: View {
    @State var searchTerm: String = ""
    @State var activeMenu: String = "foods"
    
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
                        
                        Spacer()
                    }
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 18))
                        TextField("Search", text: $searchTerm)
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
                    HStack {
                        VStack(spacing: 20) {
                            
                            Spacer()
                            Text("Veggie tomato mix")
                                .font(.system(.title2, design: .rounded).bold())
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                            
                            Text("N1,900")
                                .font(.system(.title3, design: .rounded))
                                .foregroundColor(Color(HomeViewConstant.activeColor))
                                .bold()
                        }
                        .padding(30)
                        .padding(.bottom, 20)
                        .frame(width: 220, height: 270)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .overlay(
                            Image("dish-1")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 160, height: 160)
                                .clipShape(Circle())
                                .offset(y: -120)
                        )
                        
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
