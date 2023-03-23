//
//  User.swift
//  LibraryMoviesMarvel
//
//  Created by Barbara Ann Pereira Lima on 15/02/23.
//

import Moya

let provider = MoyaProvider<MovieService>()
provider.request(.createUser(firstName: "Bárbara", lastName: "Lima")) { result in
    // do something with the result (read on for more details)
}

// The full request will result to the following:
// POST https://api.myservice.com/users
// Request body:
// {
//   "first_name": "James",
//   "last_name": "Potter"
// }

provider.request(.updateUser(id: 123, firstName: "Bárbara", lastName: "Lima")) { result in
    // do something with the result (read on for more details)
}

// The full request will result to the following:
// POST https://api.myservice.com/users/123?first_name=Bárbara&last_name=Lima
