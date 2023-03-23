//
//  MovieRemoteRepository.swift
//  LibraryMoviesMarvel
//
//  Created by Barbara Ann Pereira Lima on 14/02/23.
//
import Moya

struct MovieRemoteRepository: MovieRepository {

    private var engine: NetworkEngine<MovieService> {
            let provider = MoyaProvider<MovieService>()
            return NetworkEngine<MovieService>(provider: provider)
        }
    
    func save(movie: Movie, completion: @escaping (Result<Void, MovieError>) -> Void) {
 
    }
    
    func update(movie: Movie, completion: @escaping (Result<Void, MovieError>) -> Void) {
 
    }
    
    func delete(movie: Movie, completion: @escaping (Result<Void, MovieError>) -> Void) {
 
    }
    
    func loadMovies(completion: @escaping (Result<[Movie], MovieError>) -> Void) {
      
    }
}
