import Foundation

class StationList: ObservableObject {
    @Published var stations = [Station]()
    
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
}
