//
//  Icon.swift
//  LOTR Currency Converter
//
//  Created by Chandra on 17/02/24.
//

import SwiftUI

struct Icon: View {
    let IconImage: ImageResource
    let IconName : String
    var body: some View {
        ZStack(alignment: .bottom){
            Image(IconImage)
                .resizable()
                .scaledToFit()
            Text(IconName)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
            //order of backg matters
            
        }
        .padding(3)
        .frame(width: 100,height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 24))
    }
}

#Preview {
    Icon(IconImage: .goldpiece, IconName: "Gold Piece")
}
