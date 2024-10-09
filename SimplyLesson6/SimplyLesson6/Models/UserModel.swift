//
//  UserModel.swift
//  SimplyLesson6
//
//  Created by Suren Kazaryan on 07.10.24.
//

import Foundation

struct UserResponse: Decodable {
    let results: [UserModel]
}

struct UserModel: Decodable, Identifiable {
    let id = UUID()
    let name: Name
    let location: Location
    let email: String
    let picture: Picture
    
    struct Name: Codable {
        let first: String
        let last: String
    }
    
    struct Location: Codable {
        let city: String
        let country: String
    }
    
    var fullName: String {
        return "\(name.first) \(name.last)"
    }
    
    struct Picture: Decodable {
        let large: String
        let medium: String
        let thumbnail: String
    }

}
