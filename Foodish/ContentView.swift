//
//  ContentView.swift
//  Foodish
//
//  Created by Tony on 01/02/2022.
//

import SwiftUI

struct ContentView: View {
    @State var goToAuth: Bool = false
    
    var body: some View {
        ZStack {
            AuthenticationView()
            SplashScreen(getStarted: {self.getStarted()})
                .offset(x: goToAuth ? -(screen.width) : 0)
                .transition(.move(edge: .trailing))
                .animation(.spring(response: 0.7, dampingFraction: 0.8, blendDuration: 0))
        }
    }
    
    private func getStarted(){
        goToAuth = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

let screen = UIScreen.main.bounds
