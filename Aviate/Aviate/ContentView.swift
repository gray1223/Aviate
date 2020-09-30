//
//  ContentView.swift
//  SwitUIAppExample
//
//  Created by mac on 09/01/2020.
//  Copyright © 2020 Kamran. All rights reserved.
//

import Combine
import SwiftUI
import MapKit

class Query: ObservableObject {
    var didChange = PassthroughSubject<Void, Never>()
}

struct ContentView: View {
    
    
    
    func fetchWeather (stationICAO: String) {
        
    }
    
    mutating func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        
        weatherManager.fetchWeather(stationICAO: stationQuery)
    }
    
    func didFailWithError(error: Error) {
        print("error")
    }
    
    
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    
    @State private var stationQuery: String = ""

    var weatherManager = WeatherManager()
    
    var body: some View {

            NavigationView{
           
                VStack {
                    Text("The App for GA Pilots")
                    Spacer()
                    
                    VStack(alignment: .leading){
                        Text("News")
                            .background(Color.blue)
                            .font(.title)
                            .padding()
                            
                        Text("Aviate now supports chart lookup functionality!")
                            .padding()
                            
                            
                        
                    }
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .padding()
                    
                    
                    
                        
                    VStack(alignment: .leading) {
                        
                        Text("Favorite Airports")
                            .font(.title)
                            .padding()
                        
                        
                        List {
                            
                            
                            Section(header: Text("Favorite Airports")) {
                            NavigationLink(destination: METARView(search: stationQuery)) {
                                Text("Airport 1")
                            }
                            }
                            
                            Section(header: Text("Nearby Stations")) {
                            NavigationLink(destination: METARView(search: stationQuery)) {
                                Text("Airport 1")
                                }
                            }
                        }
                    
                        }
                    

                    Spacer()
                    
                    
                    HStack{
                        TextField("Enter ICAO", text: $stationQuery)
                            .padding()
                            .border(Color.black)
                            
                        NavigationLink(destination: METARView(search: stationQuery)) {
                            Text("Search")
                            

                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                    }
                    .padding()
                    
                    
                    
                }
                .navigationBarTitle("Aviate Home")
                
           
    }
        
    }
    
    
    
}

struct METARView: View {

    @State var weatherManager = WeatherManager()
    
    init(search: String) {
        self.weatherManager.fetchWeather(stationICAO: search)
    }
    
    var body: some View {
    
        ScrollView{
            MapView()
            
            METARReport(model: weatherManager.weather)
                
            Spacer()
        }
        .edgesIgnoringSafeArea(.horizontal)
    }
}

struct TAFView: View {

    var search: String

    var body: some View {

        ScrollView{
            Text(verbatim: "Hello")
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct AirportView: View {

    var search: String

    var body: some View {

        ScrollView{
           Text(verbatim: "Hello")
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
        
    }
}



final class DataModel: ObservableObject {
  static let shared = DataModel()
  @Published var observedString = "" {
    didSet {
      //RUNS SUCCESSFULLY
      print("Observed string changed to \(observedString)")
    }
  }
}
