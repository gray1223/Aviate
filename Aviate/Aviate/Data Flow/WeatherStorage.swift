//
//  WeatherData.swift
//  SwitUIAppExample
//
//  Created by mac on 30/09/2020.
//  Copyright © 2020 Kamran. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
   
    let flight_rules: String?
    let remarks: String?
    let wind_speed: WindSpeed?
    let wind_gust: WindGust?
    let wind_direction: WindDirection?
    let visibility: Visibility?
    let time: Time?
    let station: String?
    let temperature: Temperature?
    let raw: String?
    let dewpoint: Dewpoint?
}

struct Clouds: Codable {
    let type: String
    let altitude: Int
}

struct Time: Codable {
    let repr: String
}

struct WindSpeed: Codable {
    let value: Int
}

struct WindGust: Codable {
    let value: Int
}

struct WindDirection: Codable {
    let repr: String
}

struct Visibility: Codable {
    let repr: String
}

struct Remarks: Codable {
    let remarks: String
}

struct Altimeter: Codable {
    let repr: String?
    let spoken: String?
}

struct Temperature: Codable {
    let repr: String
}

struct Dewpoint: Codable {
    let repr: String
}

struct Wxcodes: Codable {
    let value: String
}

// WeatherModel

//
//  WeatherModel.swift
//  AvWx Pro
//
//  Created by Grayson Bertaina on 9/22/20.
//

import Foundation

struct WeatherModel {
    let reportingStation: String
    let windGust: Int
    let windSpeed: Int
    let windDirection: String
    let visibility: String
    let flightRules: String
    let time: String
    let remarks: String
    let temperature: String
    let dewpoint: String
    let rawMETAR: String

    
    var windGustString: String {
        return String(format: "%u" + "kt", windGust)
    }
    
    
    var windSpeedString: String {
        return String(format: "%u" + "kt", windSpeed)
    }
    
    
    var visUnits: String {
        return visibility + " SM"
    }
    
    var degUnits: String {
        return windDirection + "°"
    }
    
    var tempUnits: String {
        return temperature + "°C"
    }
    
    var dewUnits: String {
        return dewpoint + "°C"
    }

    
    var flightConditions: String {
        switch flightRules {
        case "VFR":
            return "green"
        case "MVFR":
            return "blue"
        case "IFR":
            return "red"
        case "LIFR":
            return "purple"
        default:
            return "gray"
        
        }
    }
}


// WeatherManager

//
//  WeatherManager.swift
//  AvWx Pro
//
//  Created by Grayson Bertaina on 9/21/20.
//

import Foundation

class WeatherManager: ObservableObject {
    
    @Published var weather: WeatherModel?
    
    let weatherURL = "https://avwx.rest/api/metar/"
    

    func fetchWeather (stationICAO: String) {
        let urlString = "\(weatherURL)\(stationICAO)?token=OVi45FiTDo1LmyodShfOfoizNe5m9wyuO6Mkc95AN-c"
        performRequest(with: urlString)
    }
    
    func performRequest (with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
                
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("error")
                    return
                }
                
                if let safeData = data {
                    self.weather = self.parseJSON(safeData)
                }
            }
            
            task.resume()
            print(urlString)
            
            
            }
        }
    
   
    private func parseJSON(_ weatherData: Data) -> WeatherModel? {
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)

           
            let reportingStationVar = decodedData.station ?? "N/A"
            let windGustValue = decodedData.wind_gust?.value ?? 0
            let windSpeedValue = decodedData.wind_speed?.value ?? 0
            let windDirectionValue = decodedData.wind_direction?.repr ?? "N/A"
            let visibilityValue = decodedData.visibility?.repr ?? "N/A"
            let flightRulesValue = decodedData.flight_rules ?? "N/A"
            let timeReportedMETAR = decodedData.time?.repr ?? "N/A"
            let remarksReportedMETAR = decodedData.remarks ?? "N/A"
            let tempMETAR = decodedData.temperature?.repr ?? "No Data"
            let dewMETAR = decodedData.dewpoint?.repr ?? "No Data"
            let rawMETARData = decodedData.raw ?? "N/A"
            
            
            
            let weather = WeatherModel(reportingStation: reportingStationVar, windGust: windGustValue, windSpeed: windSpeedValue, windDirection: windDirectionValue, visibility: visibilityValue, flightRules: flightRulesValue, time: timeReportedMETAR, remarks: remarksReportedMETAR, temperature: tempMETAR, dewpoint: dewMETAR, rawMETAR: rawMETARData)
            
            return weather
            
        } catch {
            print(error)
            return nil
        }
    }
    
    

}
