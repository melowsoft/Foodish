//
//  FoodCard.swift
//  Foodish
//
//  Created by Tony on 02/02/2022.
//

import SwiftUI

struct FoodCard: View {
    var food : Food
    
    var body: some View {
        
        
        if #available(iOS 15.0, *) {
            VStack(spacing: 20) {
                
                Spacer()
                Text(food.name)
                    .font(.system(.title2, design: .rounded).bold())
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                
                Text("N\(food.price)")
                    .font(.system(.title3, design: .rounded))
                    .foregroundColor(Color(FoodCardConstants.priceColor))
                    .bold()
            }
            .padding(30)
            .padding(.bottom, 20)
            .frame(width: 220, height: 270)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
            .overlay(
                AsyncImage(url: URL(string: food.images[0])) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 160, height: 160)
                        .clipShape(Circle())
                        .offset(y: -120)
                    
                } placeholder: {
                    ProgressView()
                        .offset(y: -100)
                }
            )
        } else {
            // Fallback on earlier versions
            
            Image(food.images[0])
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 160, height: 160)
                .clipShape(Circle())
                .offset(y: -120)

        }
    }
    
    
    
    
    private struct FoodCardConstants {
        static let priceColor = #colorLiteral(red: 1, green: 0.2941176471, blue: 0.2274509804, alpha: 1)
    }
}

struct FoodCard_Previews: PreviewProvider {
    static var previews: some View {
        FoodCard(food: foods[0])
    }
}
