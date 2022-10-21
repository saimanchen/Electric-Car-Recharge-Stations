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
            latitudeDelta: 0.2,
            longitudeDelta: 0.2))
    
    @State var selectedStation: Station?
    @State var showSheet = false
    
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
                        Image(systemName: "bolt")
                            .resizable()
                            .frame(width: 25, height: 25)
                            
                    }.onTapGesture {
                        selectedStation = station
                        showSheet = true
                    }
                }
            })
        }.sheet(isPresented: $showSheet) {
            PinPopUpView(selectedStation: $selectedStation).presentationDetents([.fraction(0.3)])
        }
        .task {
            await stationList.fetchStations()
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(stationList: StationList())
    }
}
