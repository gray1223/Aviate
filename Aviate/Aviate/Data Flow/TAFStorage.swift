// TAFData

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let tAFData = try? newJSONDecoder().decode(TAFData.self, from: jsonData)

import Foundation

// MARK: - TAFData
struct TAFData: Codable {
    let meta: MetaTAF?
        let raw, station: String
        let time: TimeTAF?
        let forecast: [ForecastTAF?]
        let startTime, endTime: TimeTAF?

    enum CodingKeys: String, CodingKey {
        case meta, raw, station, time, forecast
        case startTime = "start_time"
        case endTime = "end_time"
    }
}

// MARK: - Time
struct TimeTAF: Codable {
    let repr, dt: String?
}

// MARK: - Forecast
struct ForecastTAF: Codable {
    let altimeter: String?
    let clouds: [CloudTAF?]
    let flightRules: String?
    let sanitized: String?
    let visibility: VisibilityTAF?
    let windDirection: WindDirectionTAF?
    let windGust: WindGustTAF?
    let windSpeed: WindSpeedTAF?
    let wxCodes: [WxCodeTAF?]
    let endTime: TimeTAF?
    let raw: String
    let startTime: TimeTAF
    let type: String

    enum CodingKeys: String, CodingKey {
        case altimeter, clouds
        case flightRules = "flight_rules"
        case sanitized, visibility
        case windDirection = "wind_direction"
        case windGust = "wind_gust"
        case windSpeed = "wind_speed"
        case wxCodes = "wx_codes"
        case endTime = "end_time"
        case raw
        case startTime = "start_time"
        case type
    }
}

// MARK: - Cloud
struct CloudTAF: Codable {
    let repr, type: String?
    let altitude: Int
}

// MARK: - Visibility
struct VisibilityTAF: Codable {
    let repr: String
    let value: Int?
    let spoken: String
}

struct WindSpeedTAF: Codable {
    let repr: String
    let value: Int?
}

struct WindGustTAF: Codable {
    let repr: String
    let value: Int?
}

struct WindDirectionTAF: Codable {
    let repr: String
    let value: Int?
}

// MARK: - WxCode
struct WxCodeTAF: Codable {
    let repr, value: String
}

// MARK: - Meta
struct MetaTAF: Codable {
    let timestamp: String
}

// MARK: - Units
struct UnitsTAF: Codable {
    let altimeter, altitude, temperature, visibility: String
    let windSpeed: String

    enum CodingKeys: String, CodingKey {
        case altimeter, altitude, temperature, visibility
        case windSpeed = "wind_speed"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}


// TAFModel

// MARK: TAF Model

//
//  TAFModel.swift
//  AvWx Pro
//
//  Created by Grayson Bertaina on 9/24/20.
//

import Foundation

import Foundation

struct TAFModel {
    
    let initialTime: String?
    let forecast1lowestCloudsTypeTAF: String
    let forecast1lowestCloudsAltTAF: Int
    let forecast1middleCloudsTypeTAF: String
    let forecast1middleCloudsAltTAF: Int
    let forecast1highestCloudsTypeTAF: String
    let forecast1highestCloudsAltTAF: Int
    let reportingStationTAF: String
    let windGustTAF: String
    let windSpeedTAF: String
    let windDirectionTAF: String
    let visibilityTAF: String
    let flightRulesTAF: String
    let startTimeTAF: String
    let endTimeTAF: String
    let firstWxCodeTAF: String
    let rawTAF: String
    
    let forecast2lowestCloudsTypeTAF: String
    let forecast2lowestCloudsAltTAF: Int
    let forecast2middleCloudsTypeTAF: String
    let forecast2middleCloudsAltTAF: Int
    let forecast2highestCloudsTypeTAF: String
    let forecast2highestCloudsAltTAF: Int
    let windGustTAF2: String
    let windSpeedTAF2: String
    let windDirectionTAF2: String
    let visibilityTAF2: String
    let flightRulesTAF2: String
    let startTimeTAF2: String
    let endTimeTAF2: String
    let firstWxCodeTAF2: String
    let rawTAF2: String
    
    let forecast3lowestCloudsTypeTAF: String
    let forecast3lowestCloudsAltTAF: Int
    let forecast3middleCloudsTypeTAF: String
    let forecast3middleCloudsAltTAF: Int
    let forecast3highestCloudsTypeTAF: String
    let forecast3highestCloudsAltTAF: Int
    let windGustTAF3: String
    let windSpeedTAF3: String
    let windDirectionTAF3: String
    let visibilityTAF3: String
    let flightRulesTAF3: String
    let startTimeTAF3: String
    let endTimeTAF3: String
    let firstWxCodeTAF3: String
    let rawTAF3: String
    
    let forecast4lowestCloudsTypeTAF: String
    let forecast4lowestCloudsAltTAF: Int
    let forecast4middleCloudsTypeTAF: String
    let forecast4middleCloudsAltTAF: Int
    let forecast4highestCloudsTypeTAF: String
    let forecast4highestCloudsAltTAF: Int
    let windGustTAF4: String
    let windSpeedTAF4: String
    let windDirectionTAF4: String
    let visibilityTAF4: String
    let flightRulesTAF4: String
    let startTimeTAF4: String
    let endTimeTAF4: String
    let firstWxCodeTAF4: String
    let rawTAF4: String
    
    var forecast1altToString1TAF: String {
        return String(format: "%u" + "00 ft", forecast1lowestCloudsAltTAF)
    }
    
    var forecast1altToString2TAF: String {
        return String(format: "%u" + "00 ft", forecast1middleCloudsAltTAF)
    }
    
    var forecast1altToString3TAF: String {
        return String(format: "%u" + "00 ft", forecast1highestCloudsAltTAF)
    }
    
    var windGustStringTAF: String {
        return String(format: "%u" + "kt", windGustTAF)
    }
    
    
    var windSpeedStringTAF: String {
        return String(format: "%u" + "kt", windSpeedTAF)
    }
    
    
    var visUnitsTAF: String {
        return visibilityTAF + " SM"
    }
    
    var degUnitsTAF: String {
        return windDirectionTAF + "°"
    }
    
    
    
    
    var forecast2altToString1TAF: String {
        return String(format: "%u" + "00 ft", forecast2lowestCloudsAltTAF)
    }
    
    var forecast2altToString2TAF: String {
        return String(format: "%u" + "00 ft", forecast2middleCloudsAltTAF)
    }
    
    var forecast2altToString3TAF: String {
        return String(format: "%u" + "00 ft", forecast2highestCloudsAltTAF)
    }
    
    var windGustStringTAF2: String {
        return String(format: "%u" + "kt", windGustTAF2)
    }
    
    
    var windSpeedStringTAF2: String {
        return String(format: "%u" + "kt", windSpeedTAF2)
    }
    
    
    var visUnitsTAF2: String {
        return visibilityTAF2 + " SM"
    }
    
    var degUnitsTAF2: String {
        return windDirectionTAF2 + "°"
    }
    
    
    
    
    var forecast3altToString1TAF: String {
        return String(format: "%u" + "00 ft", forecast3lowestCloudsAltTAF)
    }
    
    var forecast3altToString2TAF: String {
        return String(format: "%u" + "00 ft", forecast3middleCloudsAltTAF)
    }
    
    var forecast3altToString3TAF: String {
        return String(format: "%u" + "00 ft", forecast3highestCloudsAltTAF)
    }
    
    var windGustStringTAF3: String {
        return String(format: "%u" + "kt", windGustTAF3)
    }
    
    
    var windSpeedStringTAF3: String {
        return String(format: "%u" + "kt", windSpeedTAF3)
    }
    
    
    var visUnitsTAF3: String {
        return visibilityTAF3 + " SM"
    }
    
    var degUnitsTAF3: String {
        return windDirectionTAF3 + "°"
    }
    
    
    var forecast4altToString1TAF: String {
        return String(format: "%u" + "00 ft", forecast4lowestCloudsAltTAF)
    }
    
    var forecast4altToString2TAF: String {
        return String(format: "%u" + "00 ft", forecast4middleCloudsAltTAF)
    }
    
    var forecast4altToString3TAF: String {
        return String(format: "%u" + "00 ft", forecast4highestCloudsAltTAF)
    }
    
    var windGustStringTAF4: String {
        return String(format: "%u" + "kt", windGustTAF4)
    }
    
    
    var windSpeedStringTAF4: String {
        return String(format: "%u" + "kt", windSpeedTAF4)
    }
    
    
    var visUnitsTAF4: String {
        return visibilityTAF4 + " SM"
    }
    
    var degUnitsTAF4: String {
        return windDirectionTAF4 + "°"
    }
    

    
    var flightConditionsTAF: String {
        switch flightRulesTAF {
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

// MARK: TAF MANAGER

//
//  TAFManager.swift
//  AvWx Pro
//
//  Created by Grayson Bertaina on 9/24/20.
//

import Foundation

protocol TAFManagerDelegate : class {
    func didUpdateTAF(_ weatherManager: TAFManager, weatherTAF: TAFModel)
    func didFailWithErrorTAF(error: Error)
}



struct TAFManager {
    let TAFURL = "https://avwx.rest/api/taf/"
    
    weak var delegate : TAFManagerDelegate?

    func fetchWeatherTAF (stationICAO: String) {
        let TAFurlString = "\(TAFURL)\(stationICAO)?token=OVi45FiTDo1LmyodShfOfoizNe5m9wyuO6Mkc95AN-c"
        performRequestTAF(with: TAFurlString)
    }
    
    func performRequestTAF (with TAFurlString: String) {
        if let TAFurl = URL(string: TAFurlString) {
            let session = URLSession(configuration: .default)
                
            
            let taskTAF = session.dataTask(with: TAFurl) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithErrorTAF(error: error!)
                    return
                }
                
                if let safeDataTAF = data {
                    if let weatherTAF = self.parseJSONTAF(safeDataTAF) {
                        self.delegate?.didUpdateTAF(self, weatherTAF: weatherTAF)
                    }
                }
            }
            
            taskTAF.resume()
            print(TAFurlString)
            
            
            }
        }
    
   
    func parseJSONTAF(_ TafData: Data) -> TAFModel? {
        
        
        do {

            let decodedDataTAF = try JSONDecoder().decode(TAFData.self, from: TafData)
            
            let forecastTAF = decodedDataTAF.forecast
            
            let wxcodes1 = (forecastTAF.count > 0 ? forecastTAF[0]?.wxCodes: nil)
            let wxcodes2 = (forecastTAF.count > 1 ? forecastTAF[1]?.wxCodes: nil)
            let wxcodes3 = (forecastTAF.count > 2 ? forecastTAF[2]?.wxCodes: nil)
            let wxcodes4 = (forecastTAF.count > 3 ? forecastTAF[3]?.wxCodes: nil)
            let clouds1 = (forecastTAF.count > 0  ? forecastTAF[0]?.clouds: nil)
            let clouds2 = (forecastTAF.count > 1  ? forecastTAF[1]?.clouds: nil)
            let clouds3 = (forecastTAF.count > 2  ? forecastTAF[2]?.clouds: nil)
            let clouds4 = (forecastTAF.count > 3  ? forecastTAF[3]?.clouds: nil)
            let forecast1lowCloudsType1 = (forecastTAF.count > 0 && clouds1!.count > 0 ? forecastTAF[0]?.clouds[0]?.type : nil) ?? "N/A"
            let forecast1lowCloudsAlt1 = (forecastTAF.count > 0 && clouds1!.count > 0 ? forecastTAF[0]?.clouds[0]?.altitude: nil) ?? 0
            let forecast1midCloudsType1 = (forecastTAF.count > 0 && clouds1!.count > 1 ? forecastTAF[0]?.clouds[1]?.type: nil) ?? "N/A"
            let forecast1midCloudsAlt1 = (forecastTAF.count > 1 && clouds1!.count > 1 ? forecastTAF[0]?.clouds[1]?.altitude : nil) ?? 0
            let forecast1highCloudsType1 = (forecastTAF.count > 0 && clouds1!.count > 2 ? forecastTAF[0]?.clouds[2]?.type : nil) ?? "N/A"
            let forecast1highCloudsAlt1 = (forecastTAF.count > 0 && clouds1!.count > 2 ? forecastTAF[0]?.clouds[2]?.altitude : nil) ?? 0
            let forecast1FlightRules = (forecastTAF.count > 0 ? forecastTAF[0]?.flightRules : nil) ?? "N/A"
            let forecast1WindSpeed = (forecastTAF.count > 0 ? forecastTAF[0]?.windSpeed?.repr: nil) ?? "N/A"
            let forecast1WindGust = (forecastTAF.count > 0 ? forecastTAF[0]?.windGust?.repr: nil) ?? "N/A"
            let forecast1WindDirection = (forecastTAF.count > 0 ? forecastTAF[0]?.windDirection?.repr: nil) ?? "N/A"
            let forecast1StartTime = (forecastTAF.count > 0 ? forecastTAF[0]?.startTime.repr: nil) ?? "N/A"
            let forecast1EndTime = (forecastTAF.count > 0 ? forecastTAF[0]?.endTime?.repr: nil) ?? "N/A"
            let forecast1WxCodes = (forecastTAF.count > 0 && wxcodes1!.count > 0 ? forecastTAF[0]?.wxCodes[0]?.repr: nil) ?? "N/A"
            let forecast1RawSegment = (forecastTAF.count > 0 ? forecastTAF[0]?.raw: nil) ?? "N/A"
            let forecast1Visibility = (forecastTAF.count > 0 ? forecastTAF[0]?.visibility?.repr : nil) ?? "N/A"
           
            let issuedTime = decodedDataTAF.time?.repr
            
            let forecast2lowCloudsType2 = (forecastTAF.count > 1 && clouds2!.count > 0 ? forecastTAF[1]?.clouds[0]?.type : nil) ?? "N/A"
            let forecast2lowCloudsAlt2 = (forecastTAF.count > 1 && clouds2!.count > 0 ? forecastTAF[1]?.clouds[0]?.altitude: nil) ?? 0
            let forecast2midCloudsType2 = (forecastTAF.count > 1 && clouds2!.count > 1 ? forecastTAF[1]?.clouds[1]?.type: nil) ?? "N/A"
            let forecast2midCloudsAlt2 = (forecastTAF.count > 1 && clouds2!.count > 1 ? forecastTAF[1]?.clouds[1]?.altitude : nil) ?? 0
            let forecast2highCloudsType2 = (forecastTAF.count > 1 && clouds2!.count > 2 ? forecastTAF[1]?.clouds[2]?.type : nil) ?? "N/A"
            let forecast2highCloudsAlt2 = (forecastTAF.count > 1 && clouds2!.count > 2 ? forecastTAF[1]?.clouds[2]?.altitude : nil) ?? 0
            let forecast2FlightRules = (forecastTAF.count > 1 ? forecastTAF[1]?.flightRules : nil) ?? "N/A"
            let forecast2WindSpeed = (forecastTAF.count > 1 ? forecastTAF[1]?.windSpeed?.repr: nil) ?? "N/A"
            let forecast2WindGust = (forecastTAF.count > 1 ? forecastTAF[1]?.windGust?.repr: nil) ?? "N/A"
            let forecast2WindDirection = (forecastTAF.count > 1 ? forecastTAF[1]?.windDirection?.repr: nil) ?? "N/A"
            let forecast2StartTime = (forecastTAF.count > 1 ? forecastTAF[1]?.startTime.repr: nil) ?? "N/A"
            let forecast2EndTime = (forecastTAF.count > 1 ? forecastTAF[1]?.endTime?.repr: nil) ?? "N/A"
            let forecast2WxCodes = (forecastTAF.count > 1 && wxcodes2!.count > 0 ? forecastTAF[1]?.wxCodes[0]?.repr: nil) ?? "N/A"
            let forecast2RawSegment = (forecastTAF.count > 1 ? forecastTAF[1]?.raw: nil) ?? "N/A"
            let forecast2Visibility = (forecastTAF.count > 1 ? forecastTAF[1]?.visibility?.repr : nil) ?? "N/A"
            
            let forecast3lowCloudsType3 = (forecastTAF.count > 2 && clouds3!.count > 0 ? forecastTAF[2]?.clouds[0]?.type : nil) ?? "N/A"
            let forecast3lowCloudsAlt3 = (forecastTAF.count > 2 && clouds3!.count > 0 ? forecastTAF[2]?.clouds[0]?.altitude: nil) ?? 0
            let forecast3midCloudsType3 = (forecastTAF.count > 2 && clouds3!.count > 1 ? forecastTAF[2]?.clouds[1]?.type: nil) ?? "N/A"
            let forecast3midCloudsAlt3 = (forecastTAF.count > 2 && clouds3!.count > 1 ? forecastTAF[2]?.clouds[1]?.altitude : nil) ?? 0
            let forecast3highCloudsType3 = (forecastTAF.count > 2 && clouds3!.count > 2 ? forecastTAF[2]?.clouds[2]?.type : nil) ?? "N/A"
            let forecast3highCloudsAlt3 = (forecastTAF.count > 2 && clouds3!.count > 2 ? forecastTAF[2]?.clouds[2]?.altitude : nil) ?? 0
            let forecast3FlightRules = (forecastTAF.count > 2 ? forecastTAF[2]?.flightRules : nil) ?? "N/A"
            let forecast3WindSpeed = (forecastTAF.count > 2 ? forecastTAF[2]?.windSpeed?.repr: nil) ?? "N/A"
            let forecast3WindGust = (forecastTAF.count > 2 ? forecastTAF[2]?.windGust?.repr: nil) ?? "N/A"
            let forecast3WindDirection = (forecastTAF.count > 2 ? forecastTAF[2]?.windDirection?.repr: nil) ?? "N/A"
            let forecast3StartTime = (forecastTAF.count > 2 ? forecastTAF[2]?.startTime.repr: nil) ?? "N/A"
            let forecast3EndTime = (forecastTAF.count > 2 ? forecastTAF[2]?.endTime?.repr: nil) ?? "N/A"
            let forecast3WxCodes = (forecastTAF.count > 2 && wxcodes3!.count > 0 ? forecastTAF[2]?.wxCodes[0]?.repr: nil) ?? "N/A"
            let forecast3RawSegment = (forecastTAF.count > 2 ? forecastTAF[2]?.raw: nil) ?? "N/A"
            let forecast3Visibility = (forecastTAF.count > 2 ? forecastTAF[2]?.visibility?.repr : nil) ?? "N/A"
            
            let forecast4lowCloudsType4 = (forecastTAF.count > 3 && clouds4!.count > 0 ? forecastTAF[3]?.clouds[0]?.type : nil) ?? "N/A"
            let forecast4lowCloudsAlt4 = (forecastTAF.count > 3 && clouds4!.count > 0 ? forecastTAF[3]?.clouds[0]?.altitude: nil) ?? 0
            let forecast4midCloudsType4 = (forecastTAF.count > 3 && clouds4!.count > 1 ? forecastTAF[3]?.clouds[1]?.type: nil) ?? "N/A"
            let forecast4midCloudsAlt4 = (forecastTAF.count > 3 && clouds4!.count > 1 ? forecastTAF[3]?.clouds[1]?.altitude : nil) ?? 0
            let forecast4highCloudsType4 = (forecastTAF.count > 3 && clouds4!.count > 2 ? forecastTAF[3]?.clouds[2]?.type : nil) ?? "N/A"
            let forecast4highCloudsAlt4 = (forecastTAF.count > 3 && clouds4!.count > 2 ? forecastTAF[3]?.clouds[2]?.altitude : nil) ?? 0
            let forecast4FlightRules = (forecastTAF.count > 3 ? forecastTAF[3]?.flightRules : nil) ?? "N/A"
            let forecast4WindSpeed = (forecastTAF.count > 3 ? forecastTAF[3]?.windSpeed?.repr: nil) ?? "N/A"
            let forecast4WindGust = (forecastTAF.count > 3 ? forecastTAF[3]?.windGust?.repr: nil) ?? "N/A"
            let forecast4WindDirection = (forecastTAF.count > 3 ? forecastTAF[3]?.windDirection?.repr: nil) ?? "N/A"
            let forecast4StartTime = (forecastTAF.count > 3 ? forecastTAF[3]?.startTime.repr: nil) ?? "N/A"
            let forecast4EndTime = (forecastTAF.count > 3 ? forecastTAF[3]?.endTime?.repr: nil) ?? "N/A"
            let forecast4WxCodes = (forecastTAF.count > 3 && wxcodes4!.count > 0 ? forecastTAF[3]?.wxCodes[0]?.repr: nil) ?? "N/A"
            let forecast4RawSegment = (forecastTAF.count > 3 ? forecastTAF[3]?.raw: nil) ?? "N/A"
            let forecast4Visibility = (forecastTAF.count > 3 ? forecastTAF[3]?.visibility?.repr : nil) ?? "N/A"
            
            let stationTAF = decodedDataTAF.station
            
            let weatherTAF = TAFModel(initialTime: issuedTime, forecast1lowestCloudsTypeTAF: forecast1lowCloudsType1, forecast1lowestCloudsAltTAF: forecast1lowCloudsAlt1, forecast1middleCloudsTypeTAF: forecast1midCloudsType1, forecast1middleCloudsAltTAF: forecast1midCloudsAlt1, forecast1highestCloudsTypeTAF: forecast1highCloudsType1, forecast1highestCloudsAltTAF: forecast1highCloudsAlt1, reportingStationTAF: stationTAF, windGustTAF: forecast1WindGust, windSpeedTAF: forecast1WindSpeed, windDirectionTAF: forecast1WindDirection, visibilityTAF: forecast1Visibility, flightRulesTAF: forecast1FlightRules, startTimeTAF: forecast1StartTime, endTimeTAF: forecast1EndTime, firstWxCodeTAF: forecast1WxCodes, rawTAF: forecast1RawSegment, forecast2lowestCloudsTypeTAF: forecast2lowCloudsType2, forecast2lowestCloudsAltTAF: forecast2lowCloudsAlt2, forecast2middleCloudsTypeTAF: forecast2midCloudsType2, forecast2middleCloudsAltTAF: forecast2midCloudsAlt2, forecast2highestCloudsTypeTAF: forecast2highCloudsType2, forecast2highestCloudsAltTAF: forecast2highCloudsAlt2, windGustTAF2: forecast2WindGust, windSpeedTAF2: forecast2WindSpeed, windDirectionTAF2: forecast2WindDirection, visibilityTAF2: forecast2Visibility, flightRulesTAF2: forecast2FlightRules, startTimeTAF2: forecast2StartTime, endTimeTAF2: forecast2EndTime, firstWxCodeTAF2: forecast2WxCodes, rawTAF2: forecast2RawSegment, forecast3lowestCloudsTypeTAF: forecast3lowCloudsType3, forecast3lowestCloudsAltTAF: forecast3lowCloudsAlt3, forecast3middleCloudsTypeTAF: forecast3midCloudsType3, forecast3middleCloudsAltTAF: forecast3midCloudsAlt3, forecast3highestCloudsTypeTAF: forecast3highCloudsType3, forecast3highestCloudsAltTAF: forecast3highCloudsAlt3, windGustTAF3: forecast3WindGust, windSpeedTAF3: forecast3WindSpeed, windDirectionTAF3: forecast3WindDirection, visibilityTAF3: forecast3Visibility, flightRulesTAF3: forecast3FlightRules, startTimeTAF3: forecast3StartTime, endTimeTAF3: forecast3EndTime, firstWxCodeTAF3: forecast3WxCodes, rawTAF3: forecast3RawSegment, forecast4lowestCloudsTypeTAF: forecast4lowCloudsType4, forecast4lowestCloudsAltTAF: forecast4lowCloudsAlt4, forecast4middleCloudsTypeTAF: forecast4midCloudsType4, forecast4middleCloudsAltTAF: forecast4midCloudsAlt4, forecast4highestCloudsTypeTAF: forecast4highCloudsType4, forecast4highestCloudsAltTAF: forecast4highCloudsAlt4, windGustTAF4: forecast4WindGust, windSpeedTAF4: forecast4WindSpeed, windDirectionTAF4: forecast4WindDirection, visibilityTAF4: forecast4Visibility, flightRulesTAF4: forecast4FlightRules, startTimeTAF4: forecast4StartTime, endTimeTAF4: forecast4EndTime, firstWxCodeTAF4: forecast4WxCodes, rawTAF4: forecast4RawSegment)
            
            delegate?.didUpdateTAF(self, weatherTAF: weatherTAF)
            return weatherTAF
            
        } catch {
            delegate?.didFailWithErrorTAF(error: error)
            return nil
        }
    }
    
    

}
    
    



