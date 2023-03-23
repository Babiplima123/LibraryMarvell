//
//  LibraryMoviesMarvelViewController.swift
//  LibraryMoviesMarvel
//
//  Created by Barbara Ann Pereira Lima on 03/01/23.
//

import UIKit
import Moya

class LibraryMoviesMarvelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let network = MoyaProvider <MovieService> ()
        network.request(.loadMovies) { result in
            switch result {
                
            case .success(let movies):
                 print(movies)
            case .failure(let error):
                print(error)
            }
        }

    }

}
