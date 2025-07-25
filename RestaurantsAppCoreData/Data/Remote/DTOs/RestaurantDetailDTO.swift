import Foundation

struct RestaurantDetailDTO: Decodable {
    let id: String
    let name: String
    let image_url: String?
    let phone: String
    let location: LocationDTO
    let coordinates: CoordinatesDTO
    let rating: Double
    let url: String?
    let categories: [CategoryDTO]?
}

struct CategoryDTO: Decodable {
    let alias: String
    let title: String
}
