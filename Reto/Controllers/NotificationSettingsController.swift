//
//  NotificationSettingsController.swift
//  Reto
//
//  Created by Ana Martinez on 16/09/25.
//

import Foundation
import SwiftUI

class NotificationSettingsController: ObservableObject {
    @Published var isPaused: Bool = false {
        didSet {
            if isPaused {
                isReactionsEnabled = false
                isReviewEnabled = false
                isReportsEnabled = false
                isActivated = false
            }
        }
    }

    @Published var isActivated: Bool = true {
        didSet {
            if isActivated {
                isReactionsEnabled = true
                isReviewEnabled = true
                isReportsEnabled = true
                isPaused = false
            }
        }
    }

    @Published var isReactionsEnabled: Bool = true {
        didSet { updateStates() }
    }

    @Published var isReviewEnabled: Bool = true {
        didSet { updateStates() }
    }

    @Published var isReportsEnabled: Bool = true {
        didSet { updateStates() }
    }

    private func updateStates() {
        let allOn = isReactionsEnabled && isReviewEnabled && isReportsEnabled
        let allOff = !isReactionsEnabled && !isReviewEnabled && !isReportsEnabled

        isActivated = allOn
        isPaused = allOff
    }
}
