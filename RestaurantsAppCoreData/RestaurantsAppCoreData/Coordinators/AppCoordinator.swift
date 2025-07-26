import Foundation
import SwiftUI

final class AppCoordinator: ObservableObject {
    private let repository: RestaurantRepository

    init() {
        let remote = RestaurantRemoteDataSource(apiService: RestaurantAPIService())
        let local = RestaurantLocalDataSource(context: CoreDataStack.shared.persistentContainer.viewContext)
        repository = RestaurantRepositoryImpl(remoteDataSource: remote, localDataSource: local)
    }

    func start() -> some View {
        let viewModel = RestaurantListViewModel(repository: repository)
        return RestaurantListView(viewModel: viewModel)
    }
}
