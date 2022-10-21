import Foundation

struct StationModel: Codable {
    var stations: [Station]
}

struct Station: Identifiable, Codable {
    var id: Int
    var title: String
    var image: String
    var description: String
    var coordinates: Coordinates
    var rating: Double
    var paid: Bool
}

struct Coordinates: Codable {
    var latitude: Double
    var longitude: Double
}
