//
//  MovieService.swift
//  LibraryMoviesMarvel
//
//  Created by Barbara Ann Pereira Lima on 09/01/23.
//

import Moya

enum MovieService {
    case loadMovies
    case save(movie: Movie)
    case update(movie: Movie)
    case delete(movie: Movie)
    case loadNameMovies
}

extension MovieService: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming") else {
            fatalError("Error to convert string url to URL")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .loadNameMovies:
            return "/api/1/"
        case .delete(let movie),
             .update(let movie),
             .save(let movie):
            return "/movies/\(movie.id)"
        case .loadMovies:
            return "/movies"
        }
    }
    
    var method: Method {
        switch self {
        case .delete:
            return .delete
        case .loadNameMovies,
                .loadMovies:
            return .get
        case .save:
            return .post
        case .update:
            return .put
        }
    }
    
    var sampleData: Data {
        switch self {
        case .loadMovies:
            return [Movie].fromJSON("MoviesMock")
        default:
            return Data()
        }
    }
    
    var task: Task {
        return .requestParameters(parameters: parameters ?? [:], encoding: parameterEncoding)
    }
    
    var parameters: [String : Any]? {
            return [
                "api_key": "4935358cf32745dc8d68b9e079f89978",
                "page": 1,
                "language": "en-US"
            ]
        }
        
    var parameterEncoding: ParameterEncoding {
            return URLEncoding.queryString
    }
    
    var headers: [String : String]? {
        return nil
    }

}
