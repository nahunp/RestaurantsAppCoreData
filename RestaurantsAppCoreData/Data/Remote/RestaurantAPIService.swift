import Combine
import Foundation

final class RestaurantAPIService {
    func fetchRestaurants() -> AnyPublisher<[RestaurantDTO], Error> {
        let query = [
            URLQueryItem(name: "term", value: "restaurants"),
            URLQueryItem(name: "location", value: "San Francisco") // Hardcoded for now
        ]
        return APIClient.shared
            .request("/search", queryItems: query)
            .map { (response: RestaurantListResponseDTO) in response.businesses }
            .eraseToAnyPublisher()
    }
    
    func fetchRestaurantDetail(id: String) -> AnyPublisher<RestaurantDetailDTO, Error> {
        return APIClient.shared
            .request("/\(id)")
            .eraseToAnyPublisher()
    }
}
