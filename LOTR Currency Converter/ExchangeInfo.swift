//
//  ExchangeInfo.swift
//  LOTR Currency Converter
//
//  Created by Chandra on 15/02/24.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            //Backgroudimg
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack{
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates")
                    .font(.title2)
                    .padding()
                ExtractedView(leftImage: .goldpiece, rightImage: .goldpenny, text: "1 Gold Piece = 4 Gold Pennies")
                ExtractedView(leftImage: .goldpenny, rightImage: .silverpiece, text: "1 Gold Penny = 4 Silver Piece")
                ExtractedView(leftImage: .silverpiece, rightImage: .silverpenny, text: "1 Silver Piece = 4 Silver Pennies")
                ExtractedView(leftImage: .silverpenny, rightImage: .copperpenny, text: "1 Silver Penny = 100 Copper Penny")
                Button("Done"){
                   dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
                
            }
            .foregroundStyle(.black)
            
        }
    }
}

#Preview {
    ExchangeInfo()
}
