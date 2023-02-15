//
//  MoviesViewModel.swift
//  LibraryMoviesMarvel
//
//  Created by Barbara Ann Pereira Lima on 14/02/23.
//
import Moya

final class MoviesViewModel {
    private let repository: MovieRepository
    var stateChange: (()-> Void)?
    private var movies: [Movie] = [] {
        didSet {
            currentState = movies.isEmpty ? .noMovies : .loaded
        }
    }
    var currentState: State = .loading {
        didSet {
            stateChange?()
        }
    }
    
    var numberOfMovies: Int {
        return movies.count
    }
    enum State: String {
        case loading = "Carregando filmes..."
        case noMovies = "Não existem filmes cadastrados."
        case loaded = ""
    }
    
    init(repository: MovieRepository = MovieRemoteRepository()) {
        self.repository = repository
    }
    
    func removeMovie(at indexPath: IndexPath) {
        if movies.indices.contains(indexPath.row) {
            self.movies.remove(at: indexPath.row)
        }
    }
    
    func movie(for indexPath: IndexPath) -> Movie? {
        return movies.indices.contains(indexPath.row) ? movies[indexPath.row] : nil
    }
    
    func loadMovies(completion: @escaping() -> Void) {
        currentState = .loading
        repository.loadMovies { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let movies):
                self.movies = movies
            }
            completion()
        }
    }
    
    func delete(movie: Movie, at indexPath: IndexPath, completion: @escaping() -> Void) {
        repository.delete(movie: movie) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success:
                self.removeMovie(at: indexPath)
            }
            completion()
        }
    }
}
