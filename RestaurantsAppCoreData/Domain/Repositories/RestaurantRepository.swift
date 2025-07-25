import Combine

protocol RestaurantRepository {
    func fetchRestaurants() -> AnyPublisher<[Restaurant], Error>
    func fetchRestaurantDetails(id: String) -> AnyPublisher<RestaurantDetail, Error>
    func getFavoriteRestaurants() -> AnyPublisher<[Restaurant], Never>
    func toggleFavorite(restaurant: Restaurant)
}
