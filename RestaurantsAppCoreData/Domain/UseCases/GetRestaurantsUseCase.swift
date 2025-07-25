import Combine

final class GetRestaurantsUseCase {
    private let repository: RestaurantRepository

    init(repository: RestaurantRepository) {
        self.repository = repository
    }

    func execute() -> AnyPublisher<[Restaurant], Error> {
        return repository.fetchRestaurants()
    }
}
