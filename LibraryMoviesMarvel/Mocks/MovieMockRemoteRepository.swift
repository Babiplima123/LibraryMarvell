//
//  MovieMockRemoteRepository.swift
//  LibraryMoviesMarvel
//
//  Created by Barbara Ann Pereira Lima on 14/02/23.
//

import Moya

struct MovieMockRemoteRepository: MovieRepository {
    private var engine: NetworkEngine<MovieService> {
        let provider = MoyaProvider<MovieService>()
        return NetworkEngine<MovieService>(provider: provider)
    }
    
    func save(movie: Movie, completion: @escaping (Result<Void, MovieError>) -> Void) {
        engine.requestVoid(target: .save(movie: movie), completion: completion)
    }
    
    func update(movie: Movie, completion: @escaping (Result<Void, MovieError>) -> Void) {
        engine.requestVoid(target: .update(movie: movie), completion: completion)
    }
    
    func delete(movie: Movie, completion: @escaping (Result<Void, MovieError>) -> Void) {
        engine.requestVoid(target: .delete(movie: movie), completion: completion)
    }
    
    func loadMovies(completion: @escaping (Result<[Movie], MovieError>) -> Void) {
        engine.request(target: .loadMovies, completion: completion)
    }
}
