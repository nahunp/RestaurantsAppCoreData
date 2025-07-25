import Combine

final class GetRestaurantDetailsUseCase {
    private let repository: RestaurantRepository

    init(repository: RestaurantRepository) {
        self.repository = repository
    }

    func execute(id: String) -> AnyPublisher<RestaurantDetail, Error> {
        return repository.fetchRestaurantDetails(id: id)
    }
}
