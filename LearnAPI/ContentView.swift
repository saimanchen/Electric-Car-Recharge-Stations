import SwiftUI

struct ContentView: View {
    @StateObject var stationList = StationList()

    var body: some View {
        ScrollView {
            ForEach(stationList.stations) { station in
                StationView(station: station)
            }
        }
        .task {
            await stationList.fetchStations()
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    @Binding var station: Station
    static var previews: some View {
        ContentView()
    }
}
