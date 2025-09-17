//
//  URLEndpoints.swift
//  TemplateReto451
//
//  Created by José Molina on 09/09/25.
//

import Foundation

struct URLEndpoints {
    static let server: String = "http://localhost:3000"
    static let login: String = String(server+"/auth/login")
    static var register: String = String(server+"/users/register")
}
