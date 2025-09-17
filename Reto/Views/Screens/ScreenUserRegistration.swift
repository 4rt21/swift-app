//
//  ScreenUserRegistration.swift
//  TemplateReto451
//
//  Created by José Molina on 26/08/25.
//

import SwiftUI

struct ScreenUserRegistration: View {
    @Environment(\.authenticationController) var authenticationController
    @State private var errors:[String]=[]
    @State private var userForm = UserForm()
    func register()async{
        do{
            let response = try await authenticationController.registerUser(name: userForm.name, email: userForm.email, password: userForm.password)
        }
        catch{
            print("Error al realizar el registro")
        }
        
    }
    var body: some View {
        VStack {
            Text("Registro de Usuario")
                .font(.system(.largeTitle, design: .rounded, weight: .bold))
            Form{
                TextField("Nombre", text: $userForm.name)
                TextField("Correo", text: $userForm.email)
                SecureField("Contraseña", text: $userForm.password)
                
                Button(action: {
                    // acción
                    errors = self.userForm.validate()
                    print(errors)
                    if errors.isEmpty{
                        Task{
                            await self.register()
                        }
                    }
                    
                }) {
                    Text("Registro")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(12)
                        .shadow(color: .blue.opacity(0.3), radius: 6, x: 0, y: 3)
                }
            }
            if !errors.isEmpty{
                ComponentErrorSummary(errors: errors)
            }
            
        }
    }
}

extension ScreenUserRegistration {
    private struct UserForm{
        var name: String = "Arturo"
        var email: String = "Arturo123@gmail.com"
        var password: String = "Arturo123"
        func validate() -> [String] {
            var errors:[String] = []
            if name.isEmptyOrWhitespace{
                errors.append("El nombre es requerido")
            }
            if email.isEmptyOrWhitespace{
                    errors.append("El correo es requerido")
                }
            if password.isEmptyOrWhitespace{
                    errors.append("La contraseña es requerida")
                }
            if !email.isValidEmail{
                    errors.append("Correo no es válido")
                }
            if !password.isValidPassword{
                    errors.append("Contraseña no es válida")
                }
            return errors
                
            
        }
    }
}

#Preview {
    ScreenUserRegistration()
}
