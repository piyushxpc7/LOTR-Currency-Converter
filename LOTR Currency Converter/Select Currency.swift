//
//  Select Currency.swift
//  LOTR Currency Converter
//
//  Created by Chandra on 17/02/24.
//

import SwiftUI

struct Select_Currency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var topcurrency : Currency
    @Binding var bottomcurrency : Currency
    
 
    var body: some View {
        ZStack{
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
                    VStack{
                        Text("Select the currency")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                        IconGrid(selectedcurrency: $topcurrency)
                        
                        Text("Select Currency to convert to")
                            .fontWeight(.bold)
                        
                        IconGrid(selectedcurrency: $bottomcurrency)
                        
                        
                        Button("Done"){
                           dismiss()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.brown)
                        .font(.largeTitle)
                        .padding()
                        .foregroundStyle(.white)
                    }
                    .multilineTextAlignment(.center)
                    .padding()
            
                }
        }
    }


#Preview {
    Select_Currency(topcurrency: .constant(.CopperPenny), bottomcurrency: .constant(.SilverPenny))
}
