//
//  NetworkEngine.swift
//  LibraryMoviesMarvel
//
//  Created by Barbara Ann Pereira Lima on 14/02/23.
//
import Moya

class NetworkEngine<Target: TargetType> {
    //1
    private var provider: MoyaProvider<Target>
    //2
    init(provider: MoyaProvider<Target>) {
        self.provider = provider
    }
    //3
    func request<T: Codable>(target: Target, completion: @escaping(Result<T, MovieError>) -> Void) {
        provider.request(target) { result in
            switch result {
            case .success(let value):
                    do {
                        //4
                        return completion(Result.success(try JSONDecoder().decode(T.self, from: value.data)))
                    } catch {
                        return completion(Result.failure(MovieError.invalidJSON))
                    }
            case .failure(let error):
                return completion(Result.failure(MovieError.taskError(error: error)))
            }
        }
    }
    //5
    func requestVoid(target: Target,
                     completion: @escaping(Result<Void, MovieError>) -> Void) {
        provider.request(target) { result in
            switch result {
            case .success:
                return completion(Result.success(()))
            case .failure(let error):
                return completion(Result.failure(MovieError.taskError(error: error)))
            }
        }
    }
}
