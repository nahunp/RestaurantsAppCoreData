import Combine

protocol RestaurantLocalDataSourceProtocol {
    func fetchFavorites() -> AnyPublisher<[Restaurant], Never>
    func addFavorite(_ restaurant: Restaurant)
    func removeFavorite(by id: String)
    func isFavorite(id: String) -> Bool
}
