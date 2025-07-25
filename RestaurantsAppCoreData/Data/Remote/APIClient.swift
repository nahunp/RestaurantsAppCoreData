import Foundation
import Combine

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
    case serverError(String)
}

final class APIClient {
    static let shared = APIClient()
    
    private let session: URLSession = .shared
    private let baseURL = "https://api.yelp.com/v3/businesses" // Update if using another API
    private let apiKey = "YOUR_YELP_API_KEY"

    func request<T: Decodable>(_ path: String, queryItems: [URLQueryItem] = []) -> AnyPublisher<T, Error> {
        var components = URLComponents(string: baseURL + path)
        components?.queryItems = queryItems

        guard let url = components?.url else {
            return Fail(error: APIError.invalidURL).eraseToAnyPublisher()
        }

        var request = URLRequest(url: url)
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")

        return session.dataTaskPublisher(for: request)
            .tryMap { result in
                guard let response = result.response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                    throw APIError.invalidResponse
                }
                return result.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                return error
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
