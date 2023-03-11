//
//  ContentView.swift
//  Switch
//
//  Created by Stepan Vardanyan on 25.02.23.
//

import SwiftUI

struct AuthenticationView: View {

    @StateObject
    private var viewModel: AuthenticationViewModel

    init(viewModel: AuthenticationViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var image: some View {
        Image(systemName: viewModel.imageName)
            .imageScale(.large)
            .foregroundColor(.accentColor)
    }

    var inputView: some View {
        Group {
            TextField("Username", text: $viewModel.username)

            SecureField("Password", text: $viewModel.password)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
    }

    var actionButton: some View {
        Button {
            viewModel.onAction()
        } label: {
            Text(viewModel.actionTitle)
                .font(.title3)
                .fontWeight(.bold)
                .padding()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .background(Color.accentColor)
                .clipShape(Capsule())
        }
    }

    var resetButton: some View {
        Button {
            viewModel.onReset()
        } label: {
            Text(viewModel.resetTitle)
                .font(.title3)
                .fontWeight(.bold)
                .padding()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .background(Color.accentColor)
                .clipShape(Capsule())
        }
    }

    var content: some View {
        VStack(spacing: 16) {
            if viewModel.shouldShowInputFields {
                inputView
            }
            actionButton
        }
        .padding()
    }

    var body: some View {
        content
            .background(Color.init(white: 0.95))
            .cornerRadius(16)
            .padding()
            .disabled(viewModel.shouldDisableInputView)
            .onChange(of: viewModel.isAuthenticated) { newValue in
                if newValue == true {
                    viewModel.onReset()
                }
            }
    }
}
