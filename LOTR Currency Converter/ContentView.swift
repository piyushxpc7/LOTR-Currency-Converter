//
//  ContentView.swift
//  LOTR Currency Converter
//
//  Created by Chandra on 14/02/24.
//

import SwiftUI
import TipKit
struct ContentView: View {
    
    @State var showExchangeInfo = false
    @State var showSelectCurrency  = false
    @State var leftamount = ""
    @State var rightamount = ""
    @FocusState var leftTyping
    @FocusState var righttyping
    
    @State var leftcurrency: Currency = .SilverPenny
    @State var rightcurrency : Currency = .SilverPiece
    
    var body: some View {
        ZStack{
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            
            //BG IMAGE
            VStack{
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                
                HStack{
                    VStack{
                        HStack{
                            Image(leftcurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            Text(leftcurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                        }
                        
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .popoverTip(CurrencyTip(),arrowEdge: .bottom)
                        TextField("Amount",text: $leftamount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            .keyboardType(.decimalPad)
                            .onChange(of: leftamount) {
                                if leftTyping{
                                    rightamount =
                                    leftcurrency.convert(leftamount, to: rightcurrency)}
                            }
                            .padding()
                        
                    }
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    // =
                    VStack{
                        HStack{
                            Text(rightcurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            Image(rightcurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        TextField("Amount",text: $rightamount)
                            .textFieldStyle(.roundedBorder)
                            .focused($righttyping)
                            .keyboardType(.decimalPad)
                            .onChange(of: rightamount){
                                if righttyping == true {
                                    leftamount = rightcurrency.convert(rightamount, to: leftcurrency)
                                }
                            }
                            .padding()
                            .multilineTextAlignment(.trailing)
                    }
                    
                }.padding()
                
                    .background(.black.opacity(0.4))
                    .clipShape(.capsule)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button{
                        showExchangeInfo.toggle()
                        
                    }
                label:{
                    Image(systemName: "info.circle.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                    
                }
                .padding(.trailing)
                .sheet(isPresented: $showExchangeInfo, content: {
                    ExchangeInfo()
                }
                )
                .sheet(isPresented: $showSelectCurrency)
                    {
                        Select_Currency(topcurrency : $leftcurrency, bottomcurrency: $rightcurrency)                }
                    
                    
                    
                }
            }
            .task {
                try?  Tips.configure()
            }
        }
    }
}

#Preview {
    ContentView()
}
