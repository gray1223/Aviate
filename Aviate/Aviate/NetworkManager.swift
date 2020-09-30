import Combine
import SwiftUI

class NetworkManager: ObservableObject {
  var didChange = PassthroughSubject<NetworkManager, Never>()
  var weatherTest = WeatherList(results: []){
    didSet {
      didChange.send(self)
    }
  }
let weatherURLString = "https://avwx.rest/api/metar/"
    
  init() {
    guard let url = URL(string: "\(weatherURLString)KDAB?token=OVi45FiTDo1LmyodShfOfoizNe5m9wyuO6Mkc95AN-c") else { return }
    URLSession.shared.dataTask(with: url){ (data, response, error) in
      guard let data = data else { return }
      let weatherTest = try! JSONDecoder().decode(WeatherList.self, from: weatherTest)
      DispatchQueue.main.async {
        self.weatherTest = weatherTest
      }
    }.resume()
  }
}
