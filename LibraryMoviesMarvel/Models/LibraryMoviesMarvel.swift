//
//  LibraryMoviesMarvel
//
//  Created by Barbara Ann Pereira Lima on 03/01/23.
//

struct Movie: Codable {
    var title: String?
    var overview: String?
    var id: Int?
    //imagem do filme ?
}

struct ListMovie: Codable {
    var result: [Movie]?
}



