//
//  WxViewController.swift
//  AvWx Pro
//
//  Created by Grayson Bertaina on 9/21/20.
//

import UIKit
import SwiftUI

class WxViewController: View {

    
    var body: some View {
        Text("Hellow")
    }
    
    var weatherManager = WeatherManager()
    

    @IBOutlet weak var stationSearch: UITextField!
    
    @IBAction func saveAsWidget(_ sender: Any) {
    }
    
    @IBOutlet weak var saveAsWidgetStatus: UISwitch!
    
    func viewDidLoad() {
        stationSearch.delegate = self
 
    }

    @IBAction func searchPressed(_ sender: Any) {
        print(stationSearch.text!)
        stationSearch.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(stationSearch.text!)
        stationSearch.endEditing(true)
        return true
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let station = stationSearch.text {
            weatherManager.fetchWeather(stationICAO: station)
            
            if saveAsWidgetStatus.isOn {
                let savedICAO = stationSearch.text
                
            }
            
            
        }

        stationSearch.text = ""

    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if stationSearch.text != "" {
            
            return true
        } else {
            stationSearch.placeholder = "Type an ICAO"
            return false
        }
    }
    
    
    
    
    
   /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ReportViewController
        destinationVC.stationQuery = stationSearch.text
    }
    */
    
}


struct TestVC_Previews: PreviewProvider {
    static var previews: some View {
        WxViewController()
    }
}
