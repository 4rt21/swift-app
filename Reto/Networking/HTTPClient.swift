//
//  HTTPClient.swift
//  TemplateReto451
//
//  Created by José Molina on 02/09/25.
//

import Foundation

struct HTTPClient {
    func loginUser(email: String, password: String) async throws -> UserLoginResponse{
        let userLoginRequest = UserLoginRequest(email: email, password: password)
        let jsonData = try JSONEncoder().encode(userLoginRequest)
        let url = URL(string: URLEndpoints.login)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        let (data, response) = try await URLSession.shared.data(for: request)
        
        let userLoginResponse =  try JSONDecoder().decode(UserLoginResponse.self, from: data)
        return userLoginResponse
        
    }
    
    func registerUser(name: String, email: String, password: String) async throws -> Bool{
        var returnValue: Bool = false
        let dataRequest = UserRequest(email: email, name: name, password: password)
        let jsonData = try JSONEncoder().encode(dataRequest)
        let url = URL(string: URLEndpoints.register)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        let (data, response) = try await URLSession.shared.data(for: request)
        if let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 201,
                let string = String(data: data, encoding: .utf8) {
                    returnValue = true
            }
        return returnValue
    }
}
