//
//  ContentView.swift
//  HPCombineNetworkingExample
//
//  Created by Huy Pham on 1/6/24.
//

import SwiftUI
import HPCombineNetworking

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: createUsersView()) {
                    Text("Go to Users View")
                }
                .padding()
                NavigationLink(destination: UpdateUserView()) {
                    Text("Go to Second View")
                }
                .padding()
            }
        }
    }
}

extension ContentView {
    
    private func createUsersView() -> UsersView {
        let networkService = NetworkService(parser: JSONDataParser())
        let viewModel = UsersViewModel(networkService: networkService)
        let usersView = UsersView(viewModel: viewModel)
        return usersView
    }

//    private func createUsersView() -> UsersView {
//        let networkService = NetworkService(parser: JSONDataParser())
//        let viewModel = UsersViewModel(networkService: networkService)
//        let usersView = UsersView(viewModel: viewModel)
//        return usersView
//    }
}

#Preview {
    ContentView()
}
