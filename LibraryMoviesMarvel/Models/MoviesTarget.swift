//
//  MoviesTarget.swift
//  LibraryMoviesMarvel
//
//  Created by Barbara Ann Pereira Lima on 09/01/23.
//

enum MoviesTarget {
    case loadMovies
    case save(movie: Movie)
    case update(movie: Movie)
    case delete(movie: Movie)
    case loadNameMovies
}
