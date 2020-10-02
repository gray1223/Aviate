

import SwiftUI
import MapKit

struct MapView: View {
    
    
    
    
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.034, longitude: -0.443), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var body: some View {
//        Map(coordinateRegion: $region)
          Text(verbatim: "Hello")
        
    }
    
}
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
