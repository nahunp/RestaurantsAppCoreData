import SwiftUICore
import SwiftUI

struct RestaurantListView: View {
    @StateObject var viewModel: RestaurantListViewModel

    var body: some View {
        NavigationView {
            content
                .navigationTitle("Restaurants")
                .onAppear {
                    viewModel.fetchRestaurants()
                }
        }
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .idle, .loading:
            ProgressView("Loading...")
        case .success(let restaurants):
            List(restaurants) { restaurant in
                RestaurantRowView(restaurant: restaurant) {
                    viewModel.toggleFavorite(restaurant)
                }
            }
        case .empty:
            Text("No restaurants found.")
                .foregroundColor(.secondary)
        case .error(let message):
            Text(message)
                .foregroundColor(.red)
        }
    }
}

