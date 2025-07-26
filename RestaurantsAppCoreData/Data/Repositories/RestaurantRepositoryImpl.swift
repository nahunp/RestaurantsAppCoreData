import Foundation
import Combine

final class RestaurantRepositoryImpl: RestaurantRepository {

    private let remoteDataSource: RestaurantRemoteDataSourceProtocol
    private let localDataSource: RestaurantLocalDataSourceProtocol

    init(
        remoteDataSource: RestaurantRemoteDataSourceProtocol,
        localDataSource: RestaurantLocalDataSourceProtocol
    ) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }

    func fetchRestaurants() -> AnyPublisher<[Restaurant], Error> {
        return remoteDataSource.fetchRestaurants()
            .map { [weak self] remoteRestaurants in
                remoteRestaurants.map { restaurant in
                    var updated = restaurant
                    updated.isFavorite = self?.localDataSource.isFavorite(id: restaurant.id) ?? false
                    return updated
                }
            }
            .eraseToAnyPublisher()
    }

    func fetchRestaurantDetails(id: String) -> AnyPublisher<RestaurantDetail, Error> {
        return remoteDataSource.fetchRestaurantDetails(id: id)
            .map { [weak self] detail in
                var updated = detail
                updated.isFavorite = self?.localDataSource.isFavorite(id: detail.id) ?? false
                return updated
            }
            .eraseToAnyPublisher()
    }

    func getFavoriteRestaurants() -> AnyPublisher<[Restaurant], Never> {
        return localDataSource.fetchFavorites()
            .eraseToAnyPublisher()
    }

    func toggleFavorite(restaurant: Restaurant) {
        if localDataSource.isFavorite(id: restaurant.id) {
            localDataSource.removeFavorite(by: restaurant.id)
        } else {
            localDataSource.addFavorite(restaurant)
        }
    }
}
