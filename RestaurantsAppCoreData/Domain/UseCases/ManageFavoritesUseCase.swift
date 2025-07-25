import Combine

final class ManageFavoritesUseCase {
    private let repository: RestaurantRepository

    init(repository: RestaurantRepository) {
        self.repository = repository
    }

    func toggleFavorite(restaurant: Restaurant) {
        repository.toggleFavorite(restaurant: restaurant)
    }

    func getFavorites() -> AnyPublisher<[Restaurant], Never> {
        return repository.getFavoriteRestaurants()
    }
}
