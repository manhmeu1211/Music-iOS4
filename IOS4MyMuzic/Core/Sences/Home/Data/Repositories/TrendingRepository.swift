final class TrendingRepository: TrendingRepositoryProtocol {
    private let api: TrendingAPIDataSource

    init(api: TrendingAPIDataSource) {
        self.api = api
    }

    func getTrendingSections() async throws -> [TrendingSection] {
        let dtos = try await api.fetchTrendingSections()
        return dtos.map { $0.toEntity() }
    }
}
