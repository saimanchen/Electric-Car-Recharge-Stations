import SwiftUI

struct ContentView: View {
    @State var stations = [Station]()
    
    func fetchStations() async {
        guard let url = URL(string: "http://gaddr.co/ios/stations") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(StationModel.self, from: data) {
                stations = decodedResponse.stations
            }
            
        } catch {
            print("Error when retrieving data!")
        }
    }
    var body: some View {
        ScrollView {
            ForEach(stations) { station in
                StationView(station: station)
            }
        }
        .task {
            await fetchStations()
            
        }
        .padding()
    }
}

struct StationView: View {
    var station: Station
    var body: some View {
        ZStack(alignment: .leading) {
            // background image
            AsyncImage(
                url:
                    URL(string: station.image),
                
                content: { image in
                    image.resizable().opacity(0.8)
                },
                
                placeholder: {
                    Text("Loading...")
                        .foregroundColor(.white)
                        .font(.title)
                }).overlay(
                    LinearGradient(
                        gradient: Gradient(
                            colors: [
                                Color.black.opacity(0.01),
                                Color.black]),
                        startPoint: .center,
                        endPoint: .bottom))
            
            VStack(alignment: .leading) {
                Spacer()
                Text(station.title)
                    .font(.title)
                    .bold()
                Text(station.description)
                    .font(.caption)
            }.foregroundColor(.white).padding()
        }
        .frame(width: 350, height: 250)
        .background(.black)
        .cornerRadius(10)
        .padding(.top)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
                ContentView()
//        StationView()
    }
}
