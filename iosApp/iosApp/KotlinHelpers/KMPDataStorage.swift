//
//  UserDataStorage.swift
//  iosApp
//
//  Created by Sergey Ivanov on 23.07.2024.
//  Copyright © 2024 orgName. All rights reserved.
//

import shared
import SwiftUI

final class KMPDataStorage: ObservableObject {
    static let shared = KMPDataStorage()
    private let repository = UserDataStoreRepositoryImpl(dataStore: CreateDataStore_iosKt.createDataStore())
    @Published var gettingUser: User?

    init() {
        Task {
            await getUser()
        }
    }

    @MainActor
    func editUserData(_ userData: User) async throws {
        try await repository.editUserData(user: userData)
        await getUser()
    }

    @MainActor
    func getUser() async {
        for await flowUser in repository.getUserData() {
            self.gettingUser = flowUser
            print("flowUser: \(flowUser)")
        }
    }
}
