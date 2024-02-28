//
//  ExchangeRate.swift
//  LOTR Currency Converter
//
//  Created by Chandra on 15/02/24.
//

import Foundation
import SwiftUI

struct ExtractedView: View {
    let leftImage : ImageResource
    let rightImage : ImageResource
    let text: String
    var body: some View {
        HStack{
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            Text(text)
            
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
        }
    }
}

