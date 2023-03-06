//
//  Store.swift
//  Switch
//
//  Created by Stepan Vardanyan on 27.11.22.
//

import SwiftUI

final class Store<State, Action>: ObservableObject {

    typealias Reducer = (inout State, Action) -> Void

    @Published private(set) var state: State

    private let reducer: Reducer

    /// High priority queue. Use this queue for tasks that need to be done very fast but it can take a few seconds to finish.
    private let userInitiatedQueue = DispatchQueue(label: "switch.store.userInitiated", qos: .userInitiated)

    /// The highest priority Queue. Use this queue for user-interactive tasks, such as animations, event handling, or updating the UI.
    private let userInteractiveQueue = DispatchQueue(label: "switch.store.userInteractive", qos: .userInteractive)

    init(state: State, reducer: @escaping Reducer) {
        self.state = state
        self.reducer = reducer
    }

    func dispatch(_ action: Action, interactive: Bool = false) {
        let queue = interactive ? userInteractiveQueue : userInitiatedQueue
        queue.sync {
            reducer(&self.state, action)
        }
    }
}
