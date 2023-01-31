//
//  TargetType.swift
//  LibraryMoviesMarvel
//
//  Created by Barbara Ann Pereira Lima on 09/01/23.
//

import Moya

extension MoviesTarget: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "http://img.omdbapi.com/? apikey=[yourkey]&") else {
            fatalError("Error to convert string url to URL")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .loadNameMovies:
            return "/api/1/movies/marcas.json"
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
            return Data()
        default:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .delete(let movie),
             .update(let movie),
             .save(let movie ):
            return .requestJSONEncodable(movie)
        case .loadNameMovies,
                .loadMovies:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return NetworkConstants.Headers.contentTypeApplicationJSON
    }
    
    var validationType: ValidationType {
        return ValidationType.successCodes
    }

}
