import SwiftUI

struct ContentView: View {
    @StateObject var stationList = StationList()
    
    var body: some View {
        NavigationStack(){
            TabView {
                StationListView(stationList: stationList)
                    .tabItem {
                        Image(systemName: "list.dash")
                        Text("List")
                    }
                MapView(stationList: stationList)
                    .tabItem{
                        Image(systemName: "map.fill")
                        Text("Map")
                    }
            }
            .navigationTitle("EV Charging Stations")
            .navigationBarTitleDisplayMode(.inline)
            .frame(alignment: .center)
        }.ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
