import Combine

protocol RestaurantRemoteDataSourceProtocol {
    func fetchRestaurants() -> AnyPublisher<[Restaurant], Error>
    func fetchRestaurantDetails(id: String) -> AnyPublisher<RestaurantDetail, Error>
}
