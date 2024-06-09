//
//  UpdateUserEndpoint.swift
//  HPCombineNetworkingExample
//
//  Created by Huy Pham on 2/6/24.
//

import Foundation
import HPCombineNetworking

struct UpdateUserEndpoint: Endpoint {
    typealias Response = APIResponse<User>

    var baseURL: URL {
        return URL(string: "https://f1ad3c7c-dc45-4543-b5d4-5d571777c117.mock.pstmn.io/")!
    }

    var path: String {
        return "users/1/update"
    }

    var method: HPCombineNetworking.RequestMethod {
        return .post
    }

    var queryParameters: [String: Any]? {
        return ["token": "abcdef"]
    }

    var bodyParameters: BodyParameters?

    var headers: [String: String] {
        return [:]
    }
}
