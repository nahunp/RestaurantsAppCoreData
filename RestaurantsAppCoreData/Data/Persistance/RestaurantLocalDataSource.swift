import Foundation
import Combine
import CoreData

final class RestaurantLocalDataSource: RestaurantLocalDataSourceProtocol {
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext = CoreDataStack.shared.context) {
        self.context = context
    }

    func fetchFavorites() -> AnyPublisher<[Restaurant], Never> {
        let request: NSFetchRequest<RestaurantEntity> = RestaurantEntity.fetchRequest()
        do {
            let entities = try context.fetch(request)
            let models = entities.map(RestaurantEntityMapper.toDomain)
            return Just(models).eraseToAnyPublisher()
        } catch {
            print("Fetch error: \(error)")
            return Just([]).eraseToAnyPublisher()
        }
    }

    func addFavorite(_ restaurant: Restaurant) {
        let request: NSFetchRequest<RestaurantEntity> = RestaurantEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", restaurant.id)
        do {
            if try context.fetch(request).isEmpty {
                _ = RestaurantEntityMapper.toEntity(restaurant, context: context)
                CoreDataStack.shared.saveContext()
            }
        } catch {
            print("Add Favorite Error: \(error)")
        }
    }

    func removeFavorite(by id: String) {
        let request: NSFetchRequest<RestaurantEntity> = RestaurantEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id)
        do {
            if let entity = try context.fetch(request).first {
                context.delete(entity)
                CoreDataStack.shared.saveContext()
            }
        } catch {
            print("Remove Favorite Error: \(error)")
        }
    }

    func isFavorite(id: String) -> Bool {
        let request: NSFetchRequest<RestaurantEntity> = RestaurantEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id)
        do {
            return try context.fetch(request).first != nil
        } catch {
            print("Is Favorite Error: \(error)")
            return false
        }
    }
}
