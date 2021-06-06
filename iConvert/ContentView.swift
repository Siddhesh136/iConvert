//
//  ContentView.swift
//  iConvert
//
//  Created by Siddhesh Kadam on 03/06/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var amount = ""
    @State private var fromMeasure = 0
    @State private var toMeasure = 0
    
    let fromMeasurements = ["Celsius","Fahrenheit","Kelvin"]
    
    var finalValue :Double{
        let amountEntered = Double(amount) ?? 0
        let fromMeasureSel =  String(fromMeasurements[fromMeasure])
        let toMeasureSel = String(fromMeasurements[toMeasure])
        var finalConvertedValue : Double =  0
        
        if fromMeasureSel == "Celsius" && toMeasureSel == "Fahrenheit"{
            finalConvertedValue = ((amountEntered * 9/5) + 32)
        }
        else if(fromMeasureSel == "Celsius" && toMeasureSel == "Kelvin"){
            finalConvertedValue = amountEntered + 273.15
        }
        else if(fromMeasureSel == "Celsius" && toMeasureSel == "Celsius"){
            finalConvertedValue = amountEntered
        }
        else if(fromMeasureSel == "Fahrenheit" && toMeasureSel == "Celsius"){
            finalConvertedValue = (amountEntered  - 32) * 5/9
        }
        else if(fromMeasureSel == "Fahrenheit" && toMeasureSel == "Kelvin"){
            finalConvertedValue = (amountEntered  - 32) * 5/9 + 273.15
        }
        else if(fromMeasureSel == "Fahrenheit" && toMeasureSel == "Fahrenheit"){
            finalConvertedValue = amountEntered
        }
        else if(fromMeasureSel == "Kelvin" && toMeasureSel == "Celsius"){
            finalConvertedValue = (amountEntered - 273.15)
        }
        else if(fromMeasureSel == "Kelvin" && toMeasureSel == "Fahrenheit"){
            finalConvertedValue = (amountEntered - 273.15) * 9/5 + 32
        }
        else if(fromMeasureSel == "Kelvin" && toMeasureSel == "Kelvin"){
            finalConvertedValue = amountEntered
        }
        
        return finalConvertedValue
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section(header:Text("Enter Value for conversion ")){
                    TextField("0",text: $amount)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Choose to Convert from :")){
                    Picker("Convert From:",selection: $fromMeasure){
                        ForEach(0 ..< fromMeasurements.count){
                        Text("\(self.fromMeasurements[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Choose to Convert to :")){
                    Picker("Convert To:",selection: $toMeasure){
                        ForEach(0 ..< fromMeasurements.count){
                        Text("\(self.fromMeasurements[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Final Value")){
                    Text("Converted Value: \(finalValue,specifier: "%.2f")")
                }
                
            }.navigationBarTitle("iConvert",displayMode: .inline)
       
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
