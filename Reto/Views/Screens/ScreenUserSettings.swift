//
//  ScreenNotificationSettings.swift
//  Reto
//
//  Created by Ana Martinez on 16/09/25.
//

import SwiftUI

struct ScreenUserSettings: View {
 
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                Text("Ajustes")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color(red: 4/255, green: 9/255, blue: 69/255))
                    .frame(maxWidth: .infinity, alignment: .center)

               

                Text("Tu cuenta")
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color(red: 4/255, green: 9/255, blue: 69/255))
                    .padding(.horizontal)
                // change destination
                sectionNav(icon: "person", text: "Centro de cuentas", destination: ScreenNotificationSettings())
                
                Divider()
        
                Text("Notificaciones")
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color(red: 4/255, green: 9/255, blue: 69/255))
                    .padding(.horizontal)
                sectionNav(icon: "bell", text: "Notificaciones", destination: ScreenNotificationSettings())
                Divider()

                Text("Privacidad")
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color(red: 4/255, green: 9/255, blue: 69/255))
                    .padding(.horizontal)
                //change destination
                sectionNav(icon: "lock", text: "Privacidad de la cuenta",  destination: ScreenNotificationSettings())
                Divider()
                Text("Acceso")
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color(red: 4/255, green: 9/255, blue: 69/255))
                    .padding(.horizontal)
                
                Button(action: {
                    // Eliminar tokens
                }) {
                    Text("Cerrar sesión")
                        .fontWeight(.semibold)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(20)
                }
                
                //Change
                Spacer()
                Text("Términos y condiciones")
                                .foregroundColor(.blue)
                                .underline()
                                .frame(maxWidth: .infinity) // Ocupa todo el ancho
                                .multilineTextAlignment(.center) // Centra el texto
                                .padding()


            }
            .padding()
        }
    }

    @ViewBuilder
    func sectionNav(icon: String, text: String, destination: some View) -> some View {
        
        NavigationLink(destination: destination) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.blue)
                Text(text).foregroundColor(Color(red: 4/255, green: 9/255, blue: 69/255))
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
        }
    }
}


#Preview {
    ScreenUserSettings()
}
