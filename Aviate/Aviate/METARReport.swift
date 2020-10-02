//
//  METARReport.swift
//  SwitUIAppExample
//
//  Created by mac on 30/09/2020.
//  Copyright © 2020 Kamran. All rights reserved.
//

import SwiftUI
import Combine

struct METARReport: View {
    
    @ObservedObject var weatherManager = WeatherManager()
    
    private var query: String
    
    private var model: WeatherModel? { self.weatherManager.weather }
    
    private var clouds: [Cloud] {
        self.weatherManager.weather?.clouds ?? []
    }
    
    init(string: String) {
        self.query = string
        self.weatherManager.fetchWeather(stationICAO: query)
    }
    
    var body: some View {
        ScrollView {
            VStack{
                HStack{
                    Text("METAR Report")
                        .font(.title)
                    
                    Spacer()
                    Text("Time: " + (self.weatherManager.weather?.time ?? ""))
                        .font(.headline)
                }
                    
                .padding()
                
                HStack{
                    Text("Flight Raules")
                    
                    Spacer()
                    Text("VFR")
                        .padding()
                        .background(Color.green)
                    
                }
                .padding()
                .font(.headline)
                
                HStack(spacing: 20){
                    VStack(alignment: .leading){
                        Text("Visibility")
                        
                        Spacer()
                        Text((self.model?.visibility ?? "10") + " SM")
                        
                        
                    }
                    
                    
                    VStack(alignment: .leading){
                        Text("Temperature")
                        
                        Spacer()
                        Text((self.model?.temperature ?? "25") + " °C")
                        
                        
                    }
                    
                    VStack(alignment: .leading){
                        Text("Dew Point")
                        
                        Spacer()
                        Text((self.model?.dewpoint ?? "") + " °C")
                        
                        
                    }
                    
                }
                .padding()
                .font(.headline)
                
                VStack {
                    Text("Clouds")
                        .font(.headline)
                    ForEach(clouds, id: \.id) { cloud in
                        HStack {
                            Text(cloud.type)
                            Spacer()
                            Text(cloud.altitudeString)
                        }
                    }.padding()
                }
                
                HStack{
                    Text("Altimeter")
                    
                    Spacer()
                    Text(self.model?.altimeter?.value?.string ?? "0")
                    
                }
                .font(.headline)
                .padding()
                
                VStack{
                    Text("Wind")
                    HStack{
                        Text("5" + "kt")
                        Text("G")
                        Text("12" + "kt")
                        Text("From")
                        Text("310" + "°")
                        
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
                    Text(self.model?.remarks ?? "No Remarks")
                }
                .padding()
                .font(.headline)
            }
        }
    }
}

struct METARReport_Previews: PreviewProvider {
    static var previews: some View {
        METARReport(string: "KDAB")
    }
}
