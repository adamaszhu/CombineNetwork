enum StarWarsAPI: API {
    case main

    var path: String {
        switch self {
            case .main:
                return "https://swapi.dev/api/"
        }
    }

    var method: RequestMethod {
        switch self {
            case .main:
                return .get
        }
    }
}

import CombineNetwork
