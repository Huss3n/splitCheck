//
//  ContentView.swift
//  splitCheck
//
//  Created by Muktar Hussein on 03/11/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipAmount = 50
    @State private var selectedTipAmount = 10
    @FocusState private var amountIsFocused: Bool
    let tipsAmount = [0,50,100,150,200]
    
    var totalPerPerson: Double{
        let amount = Double(checkAmount)
        let tipChosen = Double(tipAmount)
        let people = Double(numberOfPeople)
        
        let amountPerPerson = (amount + tipChosen) / people
        
        return amountPerPerson
    }
    
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Text("Split calculator")
                        .font(.title2).bold()
                        .foregroundColor(Color(.systemBlue))
                }
                Section{
                    Text("Enter total Amount")
                    TextField("Amount: ", value:$checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach (0..<100){
                            Text("\($0)")
                        }
                    }
                    
                }
                Section{
                    Picker("Tip amount", selection: $tipAmount){
                        ForEach(tipsAmount, id:\.self){
                            Text($0, format: .number)
                        }
                    }
                    .pickerStyle(.menu)
                }
                Section{
                    Text("Total Amount")
                        .font(.callout)
                    Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    Text("Number of people : \(numberOfPeople)")
                    Text("Tip amount             : \(tipAmount)")
                }
                Section{
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }header: {
                    Text("Amount per person")
                }
                
                
            }
            .navigationTitle("Split the m")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
                
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
