//
//  ContentView.swift
//  Switch
//
//  Created by Stepan Vardanyan on 25.02.23.
//

import SwiftUI

struct AuthenticationView: View {

    private let viewModel: AuthenticationViewModel

    init(viewModel: AuthenticationViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            Image(systemName: viewModel.imageName)
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Button {
                viewModel.onAction()
            } label: {
                Text(viewModel.actionTitle)
            }

        }
        .padding()
    }
}
