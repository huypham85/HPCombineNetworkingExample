//
//  UsersView.swift
//  HPCombineNetworkingExample
//
//  Created by Huy Pham on 2/6/24.
//

import Foundation
import SwiftUI

struct UsersView: View {
    @ObservedObject var viewModel: UsersViewModel
    @State private var showError = false
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.users, id: \.userId) { user in
                    UserRowView(user: user)
                }
            }
            .listStyle(.plain)
            .overlay {
                if showError && viewModel.error != nil {
                    VStack {
                        ErrorView(errorTitle: viewModel.error?.customMessage)
                        Spacer()
                    }.transition(.move(edge: .top))
                }
            }.transition(.move(edge: .top))
        }
        .animation(.default, value: viewModel.error?.customMessage)
        .task {
            try? await Task.sleep(for: .seconds(30))
            showError.toggle()
            viewModel.fetchUsers()
        }
        .onChange(of: viewModel.error) { _, newValue in
            showError = newValue != nil
        }
    }
}

#Preview {
    UsersView(viewModel: UsersViewModel())
}
