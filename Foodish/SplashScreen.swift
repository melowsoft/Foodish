//
//  SplashScreen.swift
//  Foodish
//
//  Created by Tony on 01/02/2022.
//

import SwiftUI

struct SplashScreen: View {
    var getStarted: () -> Void
    
    var body: some View {
        ZStack {
            ZStack(alignment: .bottom) {
                Color(SplashConstant.splashColor)
                    .edgesIgnoringSafeArea(.all)
                ZStack(alignment: .bottom) {
                    ZStack(alignment: .bottom) {
                        HStack {
                            Spacer()
                            Image("splash-img-2")
                        }
                        HStack {
                            Image("splash-img-1")
                            Spacer()
                        }
                    }
                    .padding(.bottom, 50)
                    
                    LinearGradient(gradient: Gradient(colors: SplashConstant.gradientColors), startPoint: .top, endPoint: .bottom)
                        .frame(height: screen.height * 0.3)
                }
                .frame(height: screen.height * 0.65)
            }
            
            ZStack {
                VStack(spacing: 30) {
                    HStack {
                        Image("splashIcon")
                        .frame(width: 73, height: 73)
                        .background(Color.white)
                        .clipShape(Circle())
                        
                        
                        
                        Spacer()
                    }
                        
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Food for")
                                .frame(height: 45)
                            
                            Text("Everyone")
                                .frame(height: 45)
                        }
                        .font(.system(size: 60, weight: .heavy, design: .rounded))
                        .foregroundColor(.white)
                       
                    
                        Spacer()
                    }
                    
             
                    
                    Spacer()
                    
                    Button(action: {self.getStarted()}){
                        Text("Get started")
                            .font(.title3)
                            .bold()
                            .foregroundColor(Color(SplashConstant.splashColor))
                    }
                    .frame(width: screen.width * 0.8, height: 70)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    
                }
                .padding(.top, 56)
                .padding(.horizontal, 35)
                .padding(.bottom, 40)
               
            }
           
        }
    .edgesIgnoringSafeArea(.all)
}

private struct SplashConstant {
    static let splashColor = #colorLiteral(red: 1, green: 0.2941176471, blue: 0.2274509804, alpha: 1)
    static let gradientColors = [Color(#colorLiteral(red: 1, green: 0.2941176471, blue: 0.2274509804, alpha: 1)).opacity(0.001), Color(#colorLiteral(red: 1, green: 0.2941176471, blue: 0.2274509804, alpha: 1)).opacity(0.1), Color(#colorLiteral(red: 1, green: 0.2941176471, blue: 0.2274509804, alpha: 1)).opacity(0.7), Color(#colorLiteral(red: 1, green: 0.2941176471, blue: 0.2274509804, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.2941176471, blue: 0.2274509804, alpha: 1))]
   
}
    }


struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen(getStarted: {})
    }
}
