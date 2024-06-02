//
//  ErrorView.swift
//  HPCombineNetworkingExample
//
//  Created by Huy Pham on 2/6/24.
//

import Foundation
import SwiftUI

struct ErrorView: View {
    let errorTitle: String?
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundStyle(.blue)
            .frame(height: 200)
            .padding()
            .overlay {
                VStack {
                    Text(errorTitle ?? "")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                    Button("Reload") {
                        Task {
                            
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
    }
}

#Preview {
    ErrorView(errorTitle: "invalidURL")
}
