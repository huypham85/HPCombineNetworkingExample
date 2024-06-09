//
//  UsersViewModel.swift
//  HPCombineNetworkingExample
//
//  Created by Huy Pham on 1/6/24.
//

import Combine
import Foundation
import HPCombineNetworking

final class UsersViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var error: NetworkError?
    private var cancellables = Set<AnyCancellable>()
    private var networkService: Networkable

    init(networkService: Networkable) {
        self.networkService = networkService
    }

    func fetchUsers() {
        networkService.execute(request: FetchUsersEndpoint())
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    print("API finished")
                case let .failure(error):
                    self?.error = error
                }
            } receiveValue: { [weak self] response in
                self?.users = response.data
            }
            .store(in: &cancellables)
    }
}
