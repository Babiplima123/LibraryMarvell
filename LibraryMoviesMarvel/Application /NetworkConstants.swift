//
//  NetworkConstants.swift
//  LibraryMoviesMarvel
//
//  Created by Barbara Ann Pereira Lima on 09/01/23.
//
import Moya

struct NetworkConstants {
    struct URLs {
        static var baseURL: URL {
            guard let url = URL(string: "http://img.omdbapi.com/? apikey=[yourkey]&") else {
                fatalError("Error to convert string url to URL")
            }
            return url
          }
        }
    
    struct Headers {
        static var contentTypeApplicationJSON = ["Content-Type": "application/json"]
    }
}
