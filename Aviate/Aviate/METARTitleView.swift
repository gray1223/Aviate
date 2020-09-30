//
//  METARDetailView.swift
//  Aviate
//
//  Created by Grayson Bertaina on 9/29/20.
//

import SwiftUI

struct METARTitleView: View {
    
   
    @State var selected = 0
    
    
    
    var body: some View {
       
        VStack{
           
            HStack{
                Text(("Station"))
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
            
            Toggle(selected: self.$selected)
                
                .padding()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
               
            }
        
        }
    }
    
    
 


struct Toggle : View {
    
    
    @Binding var selected : Int
    
    var body: some View {
        
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

struct METARDetailView_Previews: PreviewProvider {
    static var previews: some View {
        METARTitleView()
        
    }
}
}
