//
//  ContentView.swift
//  WeSplit(Project 1)
//
//  Created by mac on 02.08.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = 0.00
    @State private var people = 0
    @State private var tip = 0
    var totalAmount: Double {
        let totalAmount = amount+Double(tip)/100*amount
        return totalAmount
    }
    var perPerson: Double {
       let perPerson = totalAmount/(Double(people)+1)
        return perPerson
    }
    @FocusState private var isFocused: Bool
    
    var body: some View {
        NavigationView {
          ZStack{
               VStack{
                 Spacer()
                   Spacer()
                   Group{
                       Group{
                       Text("WESPLIT")
                           .font(.system(size:40))
                           .fontWeight(.bold)
                           .foregroundColor(.white)
                                 }
                       Spacer()
                   
                   Text("Enter The Price:")
                           .foregroundColor(.white)
                       
                TextField("how much to pay", value: $amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                           .frame(width: UIScreen.main.bounds.width, height: 60)
                               .background(Material.ultraThinMaterial)
                               .keyboardType(.decimalPad)
                               .focused($isFocused)
                   }
                   Spacer()
                   Group{
                       Text("Tip persentage")
                           .foregroundColor(.white)
                             
                  Picker("", selection: $tip){
                      ForEach(0..<8){
                          Text("\($0*5)%")
                      }
                  }.pickerStyle(.segmented)
                                 .background(Material.ultraThinMaterial)
                       
                       Text ("People Amount")
                           .foregroundColor(.white)
                       
              Picker("", selection: $people){
                       ForEach(1..<100){
                           Text("\($0)")
                       }
              }.pickerStyle(.wheel)
                           .background(Material.ultraThinMaterial)
               
               
              }
                  
                   Spacer()
                   Spacer()
                   
                   Group {
            Text("Amount per person:")
                           .foregroundColor(.white)
                       
            Text(perPerson,format: .currency(code: Locale.current.currencyCode ?? "USD")).frame(width: UIScreen.main.bounds.width, height: 140)
                           .background(Material.ultraThinMaterial)
                   }
                   
                Spacer()
                   Spacer()
                   
               }
               .background(Color("Color"))
               .ignoresSafeArea()
               .toolbar{
                   ToolbarItemGroup(placement: .keyboard){
                      
                       Button("Done"){
                           isFocused = false
          }
                            
                        }
                    }
                
          }
        }.preferredColorScheme(.dark)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
