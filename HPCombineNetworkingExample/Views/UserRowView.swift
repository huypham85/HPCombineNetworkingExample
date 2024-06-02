//
//  UserRowView.swift
//  HPCombineNetworkingExample
//
//  Created by Huy Pham on 2/6/24.
//

import SwiftUI

struct UserRowView: View {
    @State private var user: User
    init(user: User) {
        self.user = user
    }
    var body: some View {
        VStack {
            HStack {
                Text(user.userId)
                Text(user.name)
            }
            Text(user.email)
        }
    }
}

#Preview {
    UserRowView(user: User.testUserData())
}
