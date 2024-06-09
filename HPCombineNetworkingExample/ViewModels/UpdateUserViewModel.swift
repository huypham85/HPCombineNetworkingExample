//
//  UpdateUserViewModel.swift
//  HPCombineNetworkingExample
//
//  Created by Huy Pham on 10/6/24.
//

import Combine
import Foundation
import HPCombineNetworking

enum UpdateUserViewState {
    case idle
    case loading
    case success
    case failure(NetworkError)
}

class UpdateUserViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var error: NetworkError?
    @Published var state: UpdateUserViewState = .idle
    private var networkService: Networkable
    private var cancellables = Set<AnyCancellable>()

    init(networkService: Networkable) {
        self.networkService = networkService
    }

    func updateUser() {
        let jsonBody = JSONBodyParameters(
            JSONObject: ["name": name, "email": email]
        )
        networkService.execute(request: UpdateUserEndpoint(bodyParameters: jsonBody))
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard let self else { return }
                switch completion {
                case .finished:
                    self.state = .idle
                case let .failure(error):
                    self.state = .failure(error)
                }
            } receiveValue: { [weak self] _ in
                self?.state = .success
            }
            .store(in: &cancellables)
    }
}
