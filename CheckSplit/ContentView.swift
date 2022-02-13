//
//  ContentView.swift
//  CheckSplit
//
//  Created by Barış Bulgan on 11.02.2022.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var inputFocus:Bool
    @State private var totalAmount = 0
    @State private var totalPeople = 2
    let tipOptions = [10,15,20,25]
    @State private var defaultTip = 20
   

   
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Check amount", value: $totalAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.numberPad)
                        .focused($inputFocus, equals: true)
                    
                }header: {
                    Text("total amount")
                }
                Section{
                    TextField("How many people", value: $totalPeople, format:
                        .number)
                        .keyboardType(.numberPad)
                        .focused($inputFocus, equals: true)
                    
                }header: {
                    Text("How many people")
                }
                Section{
                    Picker("Tip", selection: $defaultTip) {
                        ForEach(tipOptions, id:\.self){
                            Text(String($0)) // format % olarak ayarlanacak
                        }
                    }.pickerStyle(.segmented)
                }header: {
                    Text("tip percentage")
                }
                
            }.navigationTitle("CheckSplit")
        }
 
    }
            
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


