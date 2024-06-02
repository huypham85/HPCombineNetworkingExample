//
//  UserEndpoint.swift
//  HPCombineNetworkingExample
//
//  Created by Huy Pham on 1/6/24.
//

import Foundation
import HPCombineNetworking

struct FetchUsersEndpoint: Endpoint {
    typealias Response = APIResponse<[User]>

    var baseURL: URL {
        return URL(string: "https://f1ad3c7c-dc45-4543-b5d4-5d571777c117.mock.pstmn.io/")!
    }

    var path: String {
        return ""
    }

    var method: HPCombineNetworking.RequestMethod {
        return .get
    }

    var queryParameters: [String: Any]? {
        return ["token": "abcdef"]
    }

    var bodyParameters: (any HPCombineNetworking.BodyParameters)? {
        return nil
    }

    var headers: [String: String] {
        return [:]
    }
}
