import Combine

final class RemoteRestaurantRepository: RestaurantRepository {
    private let apiService: RestaurantAPIService

    init(apiService: RestaurantAPIService = RestaurantAPIService()) {
        self.apiService = apiService
    }

    func fetchRestaurants() -> AnyPublisher<[Restaurant], Error> {
        apiService.fetchRestaurants()
            .map { $0.map(RestaurantMapper.map) }
            .eraseToAnyPublisher()
    }

    func fetchRestaurantDetails(id: String) -> AnyPublisher<RestaurantDetail, Error> {
        apiService.fetchRestaurantDetail(id: id)
            .map(RestaurantMapper.mapDetail)
            .eraseToAnyPublisher()
    }

    func getFavoriteRestaurants() -> AnyPublisher<[Restaurant], Never> {
        // Stub: Return empty until Core Data
        return Just([]).eraseToAnyPublisher()
    }

    func toggleFavorite(restaurant: Restaurant) {
        // Stub: No-op for now
    }
}
