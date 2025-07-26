import Foundation
import Combine

final class RestaurantRemoteDataSource: RestaurantRemoteDataSourceProtocol {
    private let apiService: RestaurantAPIService

    init(apiService: RestaurantAPIService = RestaurantAPIService()) {
        self.apiService = apiService
    }

    func fetchRestaurants() -> AnyPublisher<[Restaurant], Error> {
        return apiService.fetchRestaurants()
            .map { dtos in
                dtos.map(RestaurantMapper.map)
            }
            .eraseToAnyPublisher()
    }

    func fetchRestaurantDetails(id: String) -> AnyPublisher<RestaurantDetail, Error> {
        return apiService.fetchRestaurantDetail(id: id)
            .map(RestaurantMapper.mapDetail)
            .eraseToAnyPublisher()
    }
}
