//
//  User.swift
//  SimplyLesson6
//
//  Created by Suren Kazaryan on 08.10.24.
//

import Foundation
import Combine

struct CustomError: Error { }

protocol UsersRepository {
  
    func fetchUsers(page: Int) -> AnyPublisher<[UserModel], Error>
    func fetchUsers() -> AnyPublisher<[UserModel], Error>
  
}

class UsersRepositoryImplementation: UsersRepository {
    
    func fetchUsers(page: Int) -> AnyPublisher<[UserModel], Error> {
          guard let url = URL(string: "https://randomuser.me/api/?page=\(page)&results=10") else {
              return Fail(error: CustomError()).eraseToAnyPublisher()
          }
          
          return URLSession.shared.dataTaskPublisher(for: url)
              .map { $0.data }
              .decode(type: UserResponse.self, decoder: JSONDecoder())
              .map { $0.results }
              .receive(on: DispatchQueue.main)
              .eraseToAnyPublisher()
      }
    
    func fetchUsers() -> AnyPublisher<[UserModel], Error> {
        guard let url = URL(string: "https://randomuser.me/api/?page=1&results=10") else {
            return Fail(error: CustomError()).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: UserResponse.self, decoder: JSONDecoder())
            .map { $0.results }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
