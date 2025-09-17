//
//  LoginScreen.swift
//  TemplateReto451
//
//  Created by José Molina on 09/09/25.
//

import SwiftUI

struct LoginScreen: View {
    @Environment(\.authenticationController) var authenticationController
    @State private var email: String = "Arturo123@gmail.com"
    @State private var password: String = "Arturo123"
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    private func login() async {
        do {
            isLoggedIn = try await authenticationController.loginUser(email: email, password: password)
        } catch {
            print("Error en login \(error.localizedDescription)")
        }
        
        
    }
    var body: some View {
        NavigationStack{
            Form {
                TextField("Correo electrónico", text: $email)
                SecureField("Contraseña", text: $password)
                Button("Iniciar sesión"){
                    Task{
                        await login()
                    }
                    
                }.foregroundStyle(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                NavigationLink("Registrarse"){
                    ScreenUserRegistration()
                }
                
                
            }
            .navigationTitle("Inicio de sesión")
        }
    }
}

#Preview {
    LoginScreen()
}
