import SwiftUI
import MapKit

struct MapView: View {
    @ObservedObject var stationList: StationList
    @State var manager = LocationManager()
    
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 59.32635576802364,
            longitude: 18.00805075638511),
        span: MKCoordinateSpan(
            latitudeDelta: 10.0,
            longitudeDelta: 10.0))
    
    @State var places = [
        Place(name: "STI",
              latitude: 59.309699281164114,
              longitude: 18.02152349684837),
        Place(name: "Sätra",
              latitude: 59.28483398375977,
              longitude: 17.923229012192998)
    ]
    
    var body: some View {
        
        Map(coordinateRegion: $region,
            interactionModes: [.all],
            userTrackingMode: .constant(.follow),
            annotationItems: stationList.stations) { station in
            
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: station.coordinates.latitude, longitude: station.coordinates.longitude), content: {
                VStack {
                    ZStack {
                        Circle()
                            .fill(.blue)
                            .frame(width: 45, height: 45)
                        Image(systemName: "house")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                }
            })
        }.task {
            await stationList.fetchStations()
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(stationList: StationList())
    }
}
