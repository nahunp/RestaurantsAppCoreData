import SwiftUI

final class RestaurantListCoordinator {
    private let repository: RestaurantRepository

    init(repository: RestaurantRepository) {
        self.repository = repository
    }

    func start() -> some View {
        let viewModel = RestaurantListViewModel(repository: repository)
        return RestaurantListView(viewModel: viewModel)
    }
}
