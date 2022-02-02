//
//  HomeView.swift
//  Foodish
//
//  Created by Tony on 01/02/2022.
//

import SwiftUI

struct Home: View {
    
    
    var body: some View {
        ZStack {
            Color(TabConstants.background)
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                FavoriteView()
                    .tabItem {
                        Image(systemName: "heart")
                    }
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                    }
                HistoryView()
                    .tabItem {
                        Image(systemName: "clock.arrow.circlepath")
                    }
            }
           
            .accentColor(Color(TabConstants.iconColor))
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    private struct TabConstants {
        static let background = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        static let iconColor = #colorLiteral(red: 0.9803921569, green: 0.2901960784, blue: 0.04705882353, alpha: 1)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
         
    }
}
