enum StarWarsServer: Server {
    
    case main

    var endpoint: String {
        switch self {
            case .main:
                return "https://swapi.dev"
        }
    }
}

import CombineNetwork
