import Combine

protocol RestaurantLocalDataSourceProtocol {
    func addFavorite(_ restaurant: Restaurant)
    func removeFavorite(by id: String)
    func isFavorite(id: String) -> Bool
    func fetchFavorites() -> AnyPublisher<[Restaurant], Never>
}
