import Foundation
import Combine
final class RestaurantListViewModel: ObservableObject {
    @Published var state: RestaurantListViewModelState = .idle

    private let repository: RestaurantRepository
    private var cancellables = Set<AnyCancellable>()

    init(repository: RestaurantRepository) {
        self.repository = repository
    }

    func fetchRestaurants() {
        state = .loading

        repository.fetchRestaurants()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.state = .error(error.localizedDescription)
                case .finished:
                    break
                }
            } receiveValue: { [weak self] restaurants in
                if restaurants.isEmpty {
                    self?.state = .empty
                } else {
                    self?.state = .success(restaurants)
                }
            }
            .store(in: &cancellables)
    }

    func toggleFavorite(_ restaurant: Restaurant) {
        repository.toggleFavorite(restaurant: restaurant)
        fetchRestaurants()
    }
}
