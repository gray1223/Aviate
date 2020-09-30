//
//  METARReport.swift
//  SwitUIAppExample
//
//  Created by mac on 30/09/2020.
//  Copyright © 2020 Kamran. All rights reserved.
//

import SwiftUI
import Foundation


struct METARReport: View {
    
    var model: WeatherModel?
    
    @State var selected = 0
    
    
    var body: some View {
        ScrollView {
            
            VStack{
               
                HStack{
                    Text((self.model?.reportingStation ?? "N/A"))
                        .font(.largeTitle)
                    HStack{
                        Spacer()
                        Text("City" + ",")
                        Text("State")
                        }
                        
                }
                .padding()

                HStack {
                    
                    NavigationLink(destination: AirportView(search: "KDAB")) {
                            Text("Airport Information")
                        }
                        .padding()
                        
                        .background(Color.blue)
                        .foregroundColor(.white)
                }
                
               
                
               
                    
                    HStack{
                        
                        NavigationLink(destination: METARView(search: "KDAB")) {
                            Button(action: {
                                self.selected = 0
                                
                                print("Button Pressed")
                            }) {
                                Text("METAR")
                                    .frame(width: 100, height: 30)
                                    .padding(.vertical,5)
                                    .padding(.horizontal,1)
                                    .background(self.selected == 0 ? Color.blue : Color.clear)
                                    .clipShape(Capsule())
                                    
                            }
                            .foregroundColor(self.selected == 0 ? Color.white : Color.blue)
                            
                            }
                        
                        NavigationLink(destination: TAFView(search: "KDAB"))  {
                        Button(action: {
                            
                            self.selected = 1
                            print("Button Pressed")
                        }) {
                            Text("TAF")
                                .frame(width: 100, height: 30)
                                .padding(.vertical,5)
                                .padding(.horizontal,1)
                                .background(self.selected == 1 ? Color.blue : Color.clear)
                                .clipShape(Capsule())
                            
                        }
                        .foregroundColor(self.selected == 1 ? Color.white : Color.blue)
                        
                    }
                        
                   
                    
                }.padding(8)
                    .background((Color("Color")))
                    .clipShape(Capsule())
                
            }
                   
                }
            
            VStack{
            HStack{
                Text("METAR Report")
                    .font(.title)
                    
                Spacer()
                Text("Time: " + (self.model?.time ?? ""))
                    .font(.headline)
            }
            
            .padding()
            
            HStack{
                Text("Flight Rules")
                  
                Spacer()
                Text((self.model?.flightRules ?? "N/A"))
                    .padding()
                    .background(Color.green)
                 
            }
            .padding()
            .font(.headline)
            
                HStack(spacing: 20){
                    VStack(alignment: .leading){
                        Text("Visibility")
                          
                        Spacer()
                        Text((self.model?.visibility ?? "N/A") + " SM")
                            
                           
                    }
                    
                    
                    VStack(alignment: .leading){
                        Text("Temperature")
                          
                        Spacer()
                        Text((self.model?.temperature ?? "N/A") + " °C")
                         
                           
                    }
                    
                    VStack(alignment: .leading){
                        Text("Dew Point")
                          
                        Spacer()
                        Text((self.model?.dewUnits ?? "N/A"))
                           
                           
                    }
                 
            }
            .padding()
            .font(.headline)
                
                VStack(alignment: .center){
                    Text("Clouds")
                        .font(.headline)
                        .padding()
                        
                    HStack() {
                        Text("Few")
                        Spacer()
                    
                        Text("1200")
                    }
                    .padding()
                    HStack() {
                        Text("Few")
                        Spacer()
                    
                        Text("1200")
                    }
                    .padding()
                    HStack() {
                        Text("Few")
                        Spacer()
                    
                        Text("1200")
                    }
                    .padding()
                }
                .font(.headline)
            
                HStack{
                    Text("Altimeter")
                      
                    Spacer()
                    Text("29.92")
                     
                }
                .font(.headline)
                .padding()
                
                VStack{
                    Text("Wind")
                    HStack{
                        Text((self.model?.windSpeedString ?? "N/A"))
                        
                        Text("G " + (self.model?.windGustString ?? "N/A"))
                        
                        Text("From " + (self.model?.windDirection ?? "N/A") + "°")
                        
                    }
                    .padding()
                    
                }
                .font(.headline)
            
                HStack {
                    Text("Special Wx")
                    Spacer()
                    Text("+RA")
                }
                .padding()
                .font(.headline)
                
                VStack {
                    Text("Remarks")
                    Spacer()
                    Text((self.model?.remarks ?? "N/A"))
                }
                .padding()
                .font(.headline)
        }
    }
    
}

struct METARReport_Previews: PreviewProvider {
    static var previews: some View {
        METARReport()
    }
}
