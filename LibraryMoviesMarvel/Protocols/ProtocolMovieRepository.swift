//
//  ProtocolMovieRepository.swift
//  LibraryMoviesMarvel
//
//  Created by Barbara Ann Pereira Lima on 14/02/23.
//
protocol MovieRepository {
    func save (movie: Movie, completion: @escaping (Result<Void,MovieError>) -> Void)
    func update (movie: Movie, completion: @escaping (Result<Void,MovieError>) -> Void)
    func delete(movie: Movie, completion: @escaping(Result<Void,MovieError>) -> Void)
    func loadMovies(completion: @escaping(Result<[Movie],MovieError>) -> Void)
}
