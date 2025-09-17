//
//  UserRegistrationDTO.swift
//  TemplateReto451
//
//  Created by José Molina on 02/09/25.
//

import Foundation

struct UserRequest: Codable {
    let email, name, password: String
}

//To be defined by the endpoint
struct UserResponse: Decodable {
    let id: Int, email: String, name: String
}
