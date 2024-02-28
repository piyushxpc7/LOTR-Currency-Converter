//
//  IconGrid.swift
//  LOTR Currency Converter
//
//  Created by Chandra on 28/02/24.
//

import SwiftUI

struct IconGrid: View {
    @Binding var selectedcurrency  : Currency
    var body: some View {
        
        LazyVGrid(columns: [GridItem(),GridItem(),GridItem()], content: {
//                            Icon(IconImage: .copperpenny, IconName: "Copper Penny")
//                            Icon(IconImage: .silverpenny, IconName: "Silver Penny")
//                            Icon(IconImage: .silverpiece, IconName: "Silver Piece")
//                            Icon(IconImage: .goldpenny, IconName: "Gold Penny")
//                            Icon(IconImage: .goldpiece, IconName: "Gold  Piece")
            ForEach(Currency.allCases){currency in
                if selectedcurrency == currency{
                    //we can use self
                
                Icon(IconImage: currency.image, IconName: currency.name)
                    .shadow(color: .black, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .overlay{
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .stroke(lineWidth: 3)
                            .opacity(0.5)
                    }
                    }
                else {
                    Icon(IconImage: currency.image, IconName: currency.name)
                        .onTapGesture {
                            selectedcurrency = currency
                        }
                }
            }
        })
        
    }
}

#Preview {
    IconGrid(selectedcurrency: .constant(
        Currency.SilverPenny))
}
