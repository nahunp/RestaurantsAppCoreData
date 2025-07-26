enum RestaurantListViewModelState: Equatable {
    case idle
    case loading
    case success([Restaurant])
    case empty
    case error(String)
}
