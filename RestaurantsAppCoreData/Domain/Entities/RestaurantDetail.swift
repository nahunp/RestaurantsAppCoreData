import Foundation

struct RestaurantDetail {
    let id: String
    let name: String
    let description: String?
    let phone: String?
    let website: URL?
    let location: String
    let rating: Double
    let coordinates: (latitude: Double, longitude: Double)
    var isFavorite: Bool = false
}
