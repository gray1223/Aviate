//
//  WeatherData.swift
//  SwitUIAppExample
//
//  Created by mac on 30/09/2020.
//  Copyright © 2020 Kamran. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
   
    let clouds: [Cloud]?
    let wxCodes: [Wxcodes]?
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
    let altimeter: Altimeter?
}

struct Cloud: Codable {
    var id = UUID()
    let type: String
    let altitude: Decimal
    
    enum CodingKeys: String, CodingKey {
        case type, altitude
    }
    
    var altitudeString: String { NSDecimalNumber(decimal: self.altitude).stringValue }
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
    let value: Decimal?
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

extension Decimal {
    
    var string: String { NSDecimalNumber(decimal: self).stringValue }
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
    var clouds: [Cloud]
    let wxCodes: [Wxcodes]
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
    let altimeter: Altimeter?

    
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
    
    private let weatherURL = "https://avwx.rest/api/metar/"
    

    func fetchWeather (stationICAO: String) {
        guard stationICAO.isEmpty == false else { return }
        
        let urlString = "\(weatherURL)\(stationICAO)?token=OVi45FiTDo1LmyodShfOfoizNe5m9wyuO6Mkc95AN-c"
        performRequest(with: urlString)
    }
    
    private func performRequest (with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
                
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("error")
                    return
                }
                
                if let safeData = data {
                    print("Request URL String: " + urlString)
                    print("API Response: " + safeData.jsonString)
                    DispatchQueue.main.async {
                        self.weather = self.parseJSON(safeData)
                    }
                }
            }
            
            task.resume()
            }
        }
    
   
    private func parseJSON(_ weatherData: Data) -> WeatherModel? {
        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)

            print("parse Cloud: ", decodedData.clouds?.count)
            let clouds = decodedData.clouds ?? []
            let codes = decodedData.wxCodes ?? []
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
            
            let weather = WeatherModel(clouds: clouds, wxCodes: codes, reportingStation: reportingStationVar, windGust: windGustValue, windSpeed: windSpeedValue, windDirection: windDirectionValue, visibility: visibilityValue, flightRules: flightRulesValue, time: timeReportedMETAR, remarks: remarksReportedMETAR, temperature: tempMETAR, dewpoint: dewMETAR, rawMETAR: rawMETARData, altimeter: decodedData.altimeter)
            
            return weather
            
        } catch {
            print(error)
            return nil
        }
    }
}

extension Data {
    
    var jsonString: String {
        do {
            let json = try JSONSerialization.jsonObject(with: self, options: .allowFragments)
            let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            return String(data: data, encoding: .utf8)!
        } catch let error {
            return "Data can not be serialized to json with error: \(error.localizedDescription)"
        }
    }
}
