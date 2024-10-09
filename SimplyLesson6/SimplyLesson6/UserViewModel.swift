//
//  UserViewModel.swift
//  SimplyLesson6
//
//  Created by Suren Kazaryan on 07.10.24.
//

import Combine
import SwiftUI

class UserViewModel: ObservableObject {
    let usersRepositoryImplementation = UsersRepositoryImplementation()
    @Published var users: [UserModel] = []
    var currentPage: Int = 1
    var cancellables: Set<AnyCancellable> = []

    init() {
        fetchUsers()
    }
  
    func fetchUsers() {

            usersRepositoryImplementation.fetchUsers(page: currentPage)
                .sink { completion in
                    switch completion {
                    case .finished:
                        print("Прикинь, работает")
                    case .failure(let error):
                        print("Хьюстон у нас проблема: \(error)")
                    }
                } receiveValue: { newUsers in
                    self.users.append(contentsOf: newUsers)
                    self.currentPage += 1
                }
                .store(in: &cancellables)
        }
    
}
