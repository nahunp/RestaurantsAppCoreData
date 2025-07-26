import SwiftUI

struct RestaurantRowView: View {
    let restaurant: Restaurant
    let onFavoriteToggle: () -> Void

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(restaurant.name)
                    .font(.headline)
                Text(restaurant.location)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Button(action: onFavoriteToggle) {
                Image(systemName: restaurant.isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(.red)
            }
        }
    }
}
