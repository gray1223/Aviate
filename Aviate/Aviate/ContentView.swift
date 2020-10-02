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
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    
    @State private var stationQuery: String = ""
    
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
    
    private var search: String
    
    init(search: String) {
        self.search = search
    }
    
    var body: some View {
        
        ScrollView{
            MapView()
                .frame(height: 200)
            METARTitleView()
            METARReport(string: self.search)
            
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
