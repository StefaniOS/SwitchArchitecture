//
//  ContentView.swift
//  Switch
//
//  Created by Stepan Vardanyan on 25.02.23.
//

import SwiftUI

struct AuthenticationView<Presenter, ViewModel>: View where Presenter: AuthenticationPresenterProtocol,
                                                            ViewModel: AuthenticationViewModelProtocol {
    @StateObject private var presenter: Presenter

    private let viewModel: ViewModel

    init(presenter: Presenter, viewModel: ViewModel) {
        _presenter = StateObject(wrappedValue: presenter)
        self.viewModel = viewModel
    }

    var image: some View {
        Image(systemName: viewModel.imageName)
            .imageScale(.large)
            .foregroundColor(.black)
    }

    var inputView: some View {
        Group {
            TextField("Username", text: $presenter.username)

            SecureField("Password", text: $presenter.password)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
    }

    var actionButton: some View {
        Button {
            presenter.onAction()
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
            presenter.onReset()
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

            image

            if presenter.shouldShowInputFields {
                inputView
                HStack {
                    resetButton
                    actionButton
                }
            } else {
                actionButton
            }
        }
        .padding()
    }

    var body: some View {
        content
            .background(Color.init(white: 0.95))
            .cornerRadius(16)
            .padding()
            .disabled(presenter.shouldDisableInputView)

        // TODO: This is a workaround to get the state changes.
            .onChange(of: presenter.shouldShowInputFields) { newValue in
                if newValue == false {
                    presenter.onReset()
                }
            }
    }
}
