// MARK: Charts and Airport Data

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let chartData = try? newJSONDecoder().decode(ChartData.self, from: jsonData)

import Foundation

// MARK: - ChartData
struct ChartData: Codable {
    let dataPoints: [DataPoints]
    
    enum CodingKeys: String, CodingKey {
       case dataPoints = "KDAB"
    }
}

// MARK: - Kdab
struct DataPoints: Codable {
    let state: String?
    let stateFull: String?
    let city: String?
    let volume: String?
    let airportName: String?
    let military: String?
    let faaIdent: String?
    let icaoIdent: String?
    let chartSeq, chartCode, chartName, pdfName: String?
    let pdfPath: String?

    enum CodingKeys: String, CodingKey {
        case state
        case stateFull = "state_full"
        case city, volume
        case airportName = "airport_name"
        case military
        case faaIdent = "faa_ident"
        case icaoIdent = "icao_ident"
        case chartSeq = "chart_seq"
        case chartCode = "chart_code"
        case chartName = "chart_name"
        case pdfName = "pdf_name"
        case pdfPath = "pdf_path"
    }
}



import Foundation

// MARK: - ChartData
struct AirportData: Codable {
    let city, country: String?
    let elevationFt, elevationM: Int?
    let iata, icao: String?
    let latitude, longitude: Double?
    let name, note: String?
    let reporting: Bool?
    let runways: [Runway?]
    let state, type: String?
    let website: String?
    let wiki: String?

    enum CodingKeys: String, CodingKey {
        case city, country
        case elevationFt = "elevation_ft"
        case elevationM = "elevation_m"
        case iata, icao, latitude, longitude, name, note, reporting, runways, state, type, website, wiki
    }
}

// MARK: - Runway
struct Runway: Codable {
    let lengthFt, widthFt: Int?
    let ident1, ident2: String?

    enum CodingKeys: String, CodingKey {
        case lengthFt = "length_ft"
        case widthFt = "width_ft"
        case ident1, ident2
    }
}

// MARK: Data Model

//
//
//  AvWx Pro
//
//  Created by Grayson Bertaina on 9/22/20.
//

import Foundation

struct ChartModel {
    
    
    let airportNameString: String?
    let chartNameString: String?
    let pdfPathString: String?
}



struct AirportModel {
    let cityString: String
    let nameString: String
    let stateString: String
    let elevation: Int
    let runway1length: Int
    let runway1width: Int
    let runway1first: String
    let runway1second: String
    let icaoString: String
    let airportLat: Double
    let airportLong: Double
    
    let runway2length: Int
    let runway2width: Int
    let runway2first: String
    let runway2second: String
    
    let runway3length: Int
    let runway3width: Int
    let runway3first: String
    let runway3second: String
    
    let runway4length: Int
    let runway4width: Int
    let runway4first: String
    let runway4second: String
    
    let runway5length: Int
    let runway5width: Int
    let runway5first: String
    let runway5second: String
    
    let runway6length: Int
    let runway6width: Int
    let runway6first: String
    let runway6second: String
    
    var runway1lengthString: String {
        return String(format: "%u", runway1length)
    }
    
    var runway1widthString: String {
        return String(format: "%u", runway1width)
    }
    
    var runway2lengthString: String {
        return String(format: "%u", runway2length)
    }
    var runway2widthString: String {
        return String(format: "%u", runway2width)
    }
    var runway3lengthString: String {
        return String(format: "%u", runway3length)
    }
    var runway3widthString: String {
        return String(format: "%u", runway3width)
    }
    var runway4lengthString: String {
        return String(format: "%u", runway4length)
    }
    var runway4widthString: String {
        return String(format: "%u", runway4width)
    }
    
    var runway5lengthString: String {
        return String(format: "%u", runway5length)
    }
    var runway5widthString: String {
        return String(format: "%u", runway5width)
    }
    var runway6lengthString: String {
        return String(format: "%u", runway6length)
    }
    var runway6widthString: String {
        return String(format: "%u", runway6width)
    }
    var elevationString: String {
        return String(format: "%u", elevation)
    }
}


// MARK: Chart and Airport Manager

//
//  ChartManager.swift
//  AvWx Pro
//
//  Created by Grayson Bertaina on 9/21/20.
//

import Foundation


protocol ChartManagerDelegate : class {
    func didUpdateChart(_ dataManager: ChartManager, charts: ChartModel)
    func didFailWithErrorChart(error: Error)
}
 
 

protocol AirportManagerDelegate : class {
    func didUpdateAirport(_ airportManager: AirportManager, airports: AirportModel)
    func didFailWithErrorAirport(error: Error)
}



struct ChartManager {
    let chartsURL = "https://api.aviationapi.com/v1/charts?apt="
    
    weak var delegate : ChartManagerDelegate?

    
    func fetchCharts (stationICAO: String) {
        let chartString = "\(chartsURL)\(stationICAO)"
        performRequest(with: chartString)
    }
    
    func performRequest (with chartString: String) {
        if let charturl = URL(string: chartString) {
            let session = URLSession(configuration: .default)
                
            
            let charttask = session.dataTask(with: charturl) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithErrorChart(error: error!)
                    return
                }
                
                if let chartSafeData = data {
                    if let charts = self.parseJSONChart(chartSafeData) {
                        self.delegate?.didUpdateChart(self, charts: charts)
                    }
                }
            }
            
            charttask.resume()
            print(chartString)
            
            
            }
        }
    
   
    func parseJSONChart(_ chartData: Data) -> ChartModel? {
        
        
        do {
            
            
            let chartData = try? JSONDecoder().decode(ChartData.self, from: chartData)
            
            let importedChart = chartData?.dataPoints
            
            let importedListingPdf1 = importedChart?[0].pdfPath
            let airportName = importedChart?[0].airportName
            let chartName = importedChart?[0].chartName
            
            
            
            print(importedListingPdf1)
            
            let charts = ChartModel(airportNameString: airportName, chartNameString: chartName, pdfPathString: importedListingPdf1)
            
            delegate?.didUpdateChart(self, charts: charts)
            return charts
            
        } catch {
            delegate?.didFailWithErrorChart(error: error)
            return nil
        }
    }
    
    
    
    

}

struct AirportManager {
    
    weak var delegate: AirportManagerDelegate?
    
    let airportURL = "https://avwx.rest/api/station/"
    
    func fetchAirport (stationICAO: String) {
        let airportString = "\(airportURL)\(stationICAO)?token=OVi45FiTDo1LmyodShfOfoizNe5m9wyuO6Mkc95AN-c"
        performRequestAirport(with: airportString)
    }
    
    func performRequestAirport (with airportString: String) {
        if let airporturl = URL(string: airportString) {
            let session = URLSession(configuration: .default)
                
            
            let airporttask = session.dataTask(with: airporturl) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithErrorAirport(error: error!)
                    return
                }
                
                if let airportSafeData = data {
                    if let airports = self.parseJSONAirport(airportSafeData) {
                        self.delegate?.didUpdateAirport(self, airports: airports)
                    }
                }
            }
            print(airportString)
            airporttask.resume()
            
            
            }
        }
    
   
    func parseJSONAirport(_ airportData: Data) -> AirportModel? {
        
        
        do {
            let airportData = try? JSONDecoder().decode(AirportData.self, from: airportData)
            
           
            
            let runwayGroup = airportData?.runways
            
            let findLat = airportData?.latitude
            let findLong = airportData?.longitude
            
            let runway1lengthvalue = (runwayGroup!.count > 0 ? runwayGroup?[0]?.lengthFt : nil)
            let runway1widthvalue = (runwayGroup!.count > 0 ? runwayGroup?[0]?.widthFt: nil)
            let runway1firstvalue = (runwayGroup!.count > 0 ? runwayGroup?[0]?.ident1: nil)
            let runway1secondvalue = (runwayGroup!.count > 0 ? runwayGroup?[0]?.ident2: nil)
            
            let runway2lengthvalue = (runwayGroup!.count > 1 ? runwayGroup?[1]?.lengthFt : nil)
            let runway2widthvalue = (runwayGroup!.count > 1 ? runwayGroup?[1]?.widthFt: nil)
            let runway2firstvalue = (runwayGroup!.count > 1 ? runwayGroup?[1]?.ident1: nil)
            let runway2secondvalue = (runwayGroup!.count > 1 ? runwayGroup?[1]?.ident2: nil)
            
            let runway3lengthvalue = (runwayGroup!.count > 2 ? runwayGroup?[2]?.lengthFt : nil)
            let runway3widthvalue = (runwayGroup!.count > 2 ? runwayGroup?[2]?.widthFt: nil)
            let runway3firstvalue = (runwayGroup!.count > 2 ? runwayGroup?[2]?.ident1: nil)
            let runway3secondvalue = (runwayGroup!.count > 2 ? runwayGroup?[2]?.ident2: nil)
            
            let runway4lengthvalue = (runwayGroup!.count > 3 ? runwayGroup?[3]?.lengthFt : nil)
            let runway4widthvalue = (runwayGroup!.count > 3 ? runwayGroup?[3]?.widthFt: nil)
            let runway4firstvalue = (runwayGroup!.count > 3 ? runwayGroup?[3]?.ident1: nil)
            let runway4secondvalue = (runwayGroup!.count > 3 ? runwayGroup?[3]?.ident2: nil)
            
            let runway5lengthvalue = (runwayGroup!.count > 4 ? runwayGroup?[4]?.lengthFt : nil)
            let runway5widthvalue = (runwayGroup!.count > 4 ? runwayGroup?[4]?.widthFt: nil)
            let runway5firstvalue = (runwayGroup!.count > 4 ? runwayGroup?[4]?.ident1: nil)
            let runway5secondvalue = (runwayGroup!.count > 4 ? runwayGroup?[4]?.ident2: nil)
            
            let runway6lengthvalue = (runwayGroup!.count > 5 ? runwayGroup?[5]?.lengthFt : nil)
            let runway6widthvalue = (runwayGroup!.count > 5 ? runwayGroup?[5]?.widthFt: nil)
            let runway6firstvalue = (runwayGroup!.count > 5 ? runwayGroup?[5]?.ident1: nil)
            let runway6secondvalue = (runwayGroup!.count > 5 ? runwayGroup?[5]?.ident2: nil)
            
            let city = airportData?.city ?? "N/A"
            let state = airportData?.state
            let elevationLvl = airportData?.elevationFt ?? 0
            let name = airportData?.name
            let icao = airportData?.icao
            
            

    
            
            let airports = AirportModel(cityString: city , nameString: name ?? "N/A", stateString: state ?? "N/A", elevation: elevationLvl, runway1length: runway1lengthvalue ?? 0, runway1width: runway1widthvalue ?? 0, runway1first: runway1firstvalue ?? "N/A", runway1second: runway1secondvalue ?? "N/A", icaoString: icao ?? "N/A", airportLat: findLat ?? 0.00, airportLong: findLong ?? 0.00, runway2length: runway2lengthvalue ?? 0, runway2width: runway2widthvalue ?? 0, runway2first: runway2firstvalue ?? "N/A", runway2second: runway2secondvalue ?? "N/A", runway3length: runway3lengthvalue ?? 0, runway3width: runway3widthvalue ?? 0, runway3first: runway3firstvalue ?? "N/A", runway3second: runway3secondvalue ?? "N/A", runway4length: runway4lengthvalue ?? 0, runway4width: runway4widthvalue ?? 0, runway4first: runway4firstvalue ?? "N/A", runway4second: runway4secondvalue ?? "N/A", runway5length: runway5lengthvalue ?? 0, runway5width: runway5widthvalue ?? 0, runway5first: runway5firstvalue ?? "N/A", runway5second: runway5secondvalue ?? "N/A", runway6length: runway6lengthvalue ?? 0, runway6width: runway6widthvalue ?? 0, runway6first: runway6firstvalue ?? "N/A", runway6second: runway6secondvalue ?? "N/A")
            
            delegate?.didUpdateAirport(self, airports: airports)
            return airports
            
        } catch {
            delegate?.didFailWithErrorAirport(error: error)
            return nil
        }
    }
}

