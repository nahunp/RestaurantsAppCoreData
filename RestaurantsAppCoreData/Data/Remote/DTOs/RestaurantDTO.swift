import Foundation

struct RestaurantListResponseDTO: Decodable {
    let businesses: [RestaurantDTO]
}

struct RestaurantDTO: Decodable {
    let id: String
    let name: String
    let image_url: String?
    let rating: Double
    let location: LocationDTO
    let coordinates: CoordinatesDTO
}

struct LocationDTO: Decodable {
    let address1: String?
    let city: String
}

struct CoordinatesDTO: Decodable {
    let latitude: Double
    let longitude: Double
}
