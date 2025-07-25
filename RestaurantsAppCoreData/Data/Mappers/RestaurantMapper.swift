import Foundation

struct RestaurantMapper {
    static func map(dto: RestaurantDTO) -> Restaurant {
        return Restaurant(
            id: dto.id,
            name: dto.name,
            imageURL: URL(string: dto.image_url ?? ""),
            rating: dto.rating,
            location: "\(dto.location.address1 ?? ""), \(dto.location.city)",
            coordinates: Coordinates(latitude: dto.coordinates.latitude, longitude: dto.coordinates.longitude),
            isFavorite: false // Update later with Core Data
        )
    }
    
    static func mapDetail(dto: RestaurantDetailDTO) -> RestaurantDetail {
        return RestaurantDetail(
            id: dto.id,
            name: dto.name,
            description: dto.categories?.first?.title ?? "No description",
            phone: dto.phone,
            website: URL(string: dto.url ?? ""),
            location: "\(dto.location.address1 ?? ""), \(dto.location.city)",
            rating: dto.rating,
            coordinates: Coordinates(latitude: dto.coordinates.latitude, longitude: dto.coordinates.longitude),
            isFavorite: false // To be updated from local storage
        )
    }
}
