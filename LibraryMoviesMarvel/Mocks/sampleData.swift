//
//  sampleData.swift
//  LibraryMoviesMarvel
//
//  Created by Barbara Ann Pereira Lima on 14/02/23.
//
import Moya

var sampleData: Data {
    switch self {
    case .loadMovies:
        return [Movie].fromJSON("MoviesMock")
    default:
        return Data()
    }
}
