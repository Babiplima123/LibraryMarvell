//
//  MovieError.swift
//  LibraryMoviesMarvel
//
//  Created by Barbara Ann Pereira Lima on 14/02/23.
//
import Moya

enum MovieError: Error {
    case noData
    case invalidJSON
    case unknown
}
extension MovieError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        
        case .unknown:
            return self.localizedDescription
        case .noData:
            return "Sem resposta"
        case .invalidJSON:
            return "Erro ao parsear o retorno da API."
        }
    }
}
