import Foundation

struct Restaurant: Identifiable, Equatable {
    let id: String
    let name: String
    let imageURL: URL?
    let rating: Double
    let location: String
    let coordinates: Coordinates
    var isFavorite: Bool = false
}

struct Coordinates: Equatable {
    let latitude: Double
    let longitude: Double
}
