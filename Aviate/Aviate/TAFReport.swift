//
//  METARReport.swift
//  Aviate
//
//  Created by Grayson Bertaina on 9/29/20.
//

import SwiftUI

struct TAFReport: View {
    var body: some View {
        ScrollView {
            
            VStack{
                
            HStack{
                Text("TAF Report")
                    .font(.title)
                    
                Spacer()
                Text("Time: " + "1253Z")
                    .font(.headline)
            }
            
            .padding()
                // MARK: 1st Iteration
                VStack {
                    HStack{
                        Spacer()
                        Text("From " + "0514")
                        Spacer()
                        Text("To " + "0520")
                        Spacer()
                    }
                    .padding()
                    .font(.title)
                    .background(Color.black)
                    .foregroundColor(.white)
        
                    HStack{
                        Text("Flight Rules")
                          
                        Spacer()
                        Text("VFR")
                            .padding()
                            .background(Color.green)
                         
                    }
                    .padding()
                    .font(.headline)
                    
                    HStack{
                        Text("Visibility")
                          
                        Spacer()
                        Text("10" + " SM")
                            
                           
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
                    
                }
                        .padding(.top)
                        .padding(.top)
            }
           
            
            // MARK: 2nd Iteration
            VStack {
                HStack{
                    Spacer()
                    Text("From " + "0520")
                    Spacer()
                    Text("To " + "0604")
                    Spacer()
                }
                .padding()
                .font(.title)
                .background(Color.black)
                .foregroundColor(.white)
    
                HStack{
                    Text("Flight Rules")
                      
                    Spacer()
                    Text("VFR")
                        .padding()
                        .background(Color.green)
                     
                }
                .padding()
                .font(.headline)
                
                HStack{
                    Text("Visibility")
                      
                    Spacer()
                    Text("10" + " SM")
                        
                       
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
                
            }
            .padding(.top)
            .padding(.top)
            
            // MARK: 3rd Iteration
            VStack {
                HStack{
                    Spacer()
                    Text("From " + "0604")
                    Spacer()
                    Text("To " + "0605")
                    Spacer()
                }
                .padding()
                .font(.title)
                .background(Color.black)
                .foregroundColor(.white)
    
                HStack{
                    Text("Flight Rules")
                      
                    Spacer()
                    Text("VFR")
                        .padding()
                        .background(Color.green)
                     
                }
                .padding()
                .font(.headline)
                
                HStack{
                    Text("Visibility")
                      
                    Spacer()
                    Text("10" + " SM")
                        
                       
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
                
            }
            .padding(.top)
            .padding(.top)
           
            // MARK: 4th Iteration
            VStack {
                HStack{
                    Spacer()
                    Text("From " + "0605")
                    Spacer()
                    Text("To " + "0610")
                    Spacer()
                }
                .padding()
                .font(.title)
                .background(Color.black)
                .foregroundColor(.white)
    
                HStack{
                    Text("Flight Rules")
                      
                    Spacer()
                    Text("VFR")
                        .padding()
                        .background(Color.green)
                     
                }
                .padding()
                .font(.headline)
                
                HStack{
                    Text("Visibility")
                      
                    Spacer()
                    Text("10" + " SM")
                        
                       
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
                
            }
            .padding(.top)
            .padding(.top)
            

        }
       
        
    }
    
}

struct TAFReport_Previews: PreviewProvider {
    static var previews: some View {
        TAFReport()
    }
}
