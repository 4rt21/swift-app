//
//  ScreenNotificationSettings.swift
//  Reto
//
//  Created by Ana Martinez on 16/09/25.
//

import SwiftUI

struct ScreenNotificationSettings: View {
    @StateObject private var nsc = NotificationSettingsController()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                Text("Notificaciones")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color(red: 4/255, green: 9/255, blue: 69/255))
                    .frame(maxWidth: .infinity, alignment: .center)

                sectionToggle(icon: "bell", text: "Pausar todas", isOn: $nsc.isPaused)
                sectionToggle(icon: "bell", text: "Activar todas", isOn: $nsc.isActivated)

                Text("Reacciones")
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color(red: 4/255, green: 9/255, blue: 69/255))
                    .padding(.horizontal)

                sectionToggle(icon: "bell", text: "Notificarme reacciones", isOn: $nsc.isReactionsEnabled)

                Text("Procesos de revisión")
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color(red: 4/255, green: 9/255, blue: 69/255))
                    .padding(.horizontal)

                sectionToggle(icon: "bell", text: "Notificarme procesos", isOn: $nsc.isReviewEnabled)

                Text("Reportes recomendados")
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color(red: 4/255, green: 9/255, blue: 69/255))
                    .padding(.horizontal)

                sectionToggle(icon: "bell", text: "Notificarme reportes", isOn: $nsc.isReportsEnabled)
            }
            .padding()
        }
    }

    @ViewBuilder
    func sectionToggle(icon: String, text: String, isOn: Binding<Bool>) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.blue)
            Text(text)
            Spacer()
            Toggle("", isOn: isOn)
                .labelsHidden()
                .toggleStyle(SwitchToggleStyle(tint: .blue))
        }
        .padding(.horizontal)
    }
}


#Preview {
    ScreenNotificationSettings()
}
