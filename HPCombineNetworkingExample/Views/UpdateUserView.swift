//
//  UpdateUserView.swift
//  HPCombineNetworkingExample
//
//  Created by Huy Pham on 2/6/24.
//

import Foundation
import SwiftUI
import HPCombineNetworking

struct UpdateUserView: View {
    @ObservedObject var viewModel: UpdateUserViewModel
    
    var body: some View {
        VStack {
            TextField("Name", text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Submit") {
                viewModel.updateUser()
            }
            .overlay {
                switch viewModel.state {
                case .idle, .loading:
                    EmptyView()
                case let .success(message):
                    ErrorView(errorTitle: message)
//                        .transition(.move(edge: .bottom))
                case let .failure(error):
                    ErrorView(errorTitle: error.customMessage)
//                        .transition(.move(edge: .top))
                }
            }
        }
    }
}

struct UpdateUserView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateUserView(viewModel: UpdateUserViewModel(networkService: NetworkService(parser: JSONDataParser())))
    }
}
