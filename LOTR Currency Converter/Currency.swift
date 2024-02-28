//
//  Currency.swift
//  LOTR Currency Converter
//
//  Created by Chandra on 26/02/24.
//
import SwiftUI

enum Currency : Double, CaseIterable, Identifiable {
    
    
    
    case CopperPenny = 6400
    case SilverPenny = 64
    case GoldPenny = 16
    case SilverPiece = 4
    case GoldPiece = 1
    
    var id: Double{rawValue}
    //Currency{self}
    
    var image : ImageResource{
        //Computed Value
        switch self{
        case .CopperPenny : .copperpenny
        case .SilverPenny : .silverpenny
        case .GoldPenny : .goldpenny
        case.GoldPiece : .goldpiece
        case .SilverPiece : .silverpiece
            
            
            
        }
    }
    var name : String{
        switch self {
        case .CopperPenny:
            "Copper Penny"
        case .SilverPenny:
            "Silver Penny"
        case .GoldPenny:
            "Gold Penny"
        case .SilverPiece:
            "Silver Piece"
        case .GoldPiece:
            "Gold Piece"
        }
    }
    
    func convert(_ amountString: String, to currency: Currency) -> String {
        guard let doubleAmount = Double(amountString) else {
            return "Invalid input"
        }
        
        let convertedAmount = (doubleAmount / self.rawValue) * currency.rawValue
        
        // Assuming you want to return the converted amount as a string
        return String(format : "%.2f", convertedAmount)
    }
}
