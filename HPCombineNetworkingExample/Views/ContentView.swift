//
//  ContentView.swift
//  HPCombineNetworkingExample
//
//  Created by Huy Pham on 1/6/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: UsersView(viewModel: UsersViewModel())) {
                    Text("Go to First View")
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

#Preview {
    ContentView()
}
