//
//  AirportView.swift
//  Aviate
//
//  Created by Grayson Bertaina on 9/29/20.
//

import SwiftUI

var chartTypes = ["Approach", "Departure", "Airport Diagram"]

struct AirportReport: View {
    var body: some View {
        
        
        
        VStack{
        HStack{
            Text("Station")
                .font(.largeTitle)
            HStack{
                Spacer()
                Text("City" + ",")
                Text("State")
                }
                
        }
        .padding()
            
            VStack(alignment: .center){
                Text("Airport Information")
                    .font(.title)
                    .padding()
                
                HStack{
                    VStack(alignment: .leading){
                        
                    
                        Text("Runways")
                            .font(.headline)
                            .padding(.bottom, 5)
                        HStack{
                            Text("08L" + " / " + "08R")
                            Spacer()
                            Text("2000" + " ft")

                        }
                        
                        
                        HStack{
                            Text("08L" + " / " + "08R")
                            Spacer()
                            Text("2000" + " ft")

                        }
                        
                        
                        HStack{
                            Text("08L" + " / " + "08R")
                            Spacer()
                            Text("2000" + " ft")

                        }
                        HStack{
                            Text("08L" + " / " + "08R")
                            Spacer()
                            Text("2000" + " ft")

                        }
                        HStack{
                            Text("08L" + " / " + "08R")
                            Spacer()
                            Text("2000" + " ft")

                        }
                        HStack{
                            Text("08L" + " / " + "08R")
                            Spacer()
                            Text("2000" + " ft")

                        }
                       
                        
                    }
                    .padding()
                    
                    
                }
                    
                    HStack{
                        Text("Airport Manager")
                        Spacer()
                        Text("John Doe")
                    
                }
                    .font(.headline)
                    .padding()
                
                    HStack{
                        Text("Airport Phone")
                        Spacer()
                        Text("(386) 597-9976")
                    
                }
                    .font(.headline)
                    .padding()
               
                HStack{
                    Text("Elevation")
                    Spacer()
                    Text("32" + " ft")
                
            }
                .font(.headline)
                .padding()
                
                
            }
        
            
    }
        
        
        
    }
}

struct AirportView_Previews: PreviewProvider {
    static var previews: some View {
        AirportView(search: "KDAB")
            .previewDevice("iPhone 11")
    }
}
