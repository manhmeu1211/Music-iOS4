protocol APIOperation {
    associatedtype Model : Codable
    func execute(completion : @escaping (Result<Model, Error>) -> Void)
}
