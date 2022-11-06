//
//  EKEventStore+AsyncFetch.swift
//  Today
//
//  Created by Mitul Vaghamshi on 2022-11-05.
//

import Foundation
import EventKit

extension EKEventStore {
    func fetchReminders(matching predicate: NSPredicate) async throws -> [EKReminder] {
        try await withCheckedThrowingContinuation { continueation in
            fetchReminders(matching: predicate) { reminders in
                if let reminders = reminders {
                    continueation.resume(returning: reminders)
                } else {
                    continueation.resume(throwing: TodayError.failedReadingReminders)
                }
            }
        }
    }
}
