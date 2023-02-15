//
//  NetworkLoggerPlugin.swift
//  LibraryMoviesMarvel
//
//  Created by Barbara Ann Pereira Lima on 14/02/23.
//
import Moya

private var engine: NetworkEngine<MoviesTarget> {
      let logPlugin = NetworkLoggerPlugin(verbose: true, cURL: true, output: nil, requestDataFormatter: nil, responseDataFormatter: nil)
      let provider = MoyaProvider<MoviesTarget>(plugins:[logPlugin])
      return NetworkEngine<MoviesTarget>(provider: provider)
  }
