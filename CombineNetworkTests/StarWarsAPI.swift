enum StarWarsAPI: API {
    case main

    var server: Server {
        StarWarsServer.main
    }

    var path: String {
        switch self {
            case .main:
                return "/api"
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
