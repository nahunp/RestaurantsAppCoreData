import Foundation
import CoreData

struct RestaurantEntityMapper {
    static func toDomain(_ entity: RestaurantEntity) -> Restaurant {
        return Restaurant(
                id: entity.id ?? "",
                name: entity.name ?? "Unknown Name",
                imageURL: URL(string: entity.imageURL ?? ""),
                rating: entity.rating,
                location: entity.address ?? "Unknown Location",
                coordinates: Coordinates(latitude: entity.latitude, longitude: entity.longitude),
                isFavorite: true
            )
    }

    static func toEntity(_ restaurant: Restaurant, context: NSManagedObjectContext) -> RestaurantEntity {
        let entity = RestaurantEntity(context: context)
        entity.id = restaurant.id
        entity.name = restaurant.name
        entity.imageURL = restaurant.imageURL?.absoluteString ?? ""
        entity.rating = restaurant.rating
        entity.address = restaurant.location
        entity.latitude = restaurant.coordinates.latitude
        entity.longitude = restaurant.coordinates.longitude
        return entity
    }
}
