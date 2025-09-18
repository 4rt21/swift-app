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

                // Usamos métodos seguros para cambiar el estado
                sectionToggle(
                    icon: "bell",
                    text: "Pausar todas",
                    isOn: Binding(
                        get: { nsc.isPaused },
                        set: { nsc.setPaused($0) }
                    )
                )

                sectionToggle(
                    icon: "bell",
                    text: "Activar todas",
                    isOn: Binding(
                        get: { nsc.isActivated },
                        set: { nsc.setActivated($0) }
                    )
                )

                Text("Reacciones")
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color(red: 4/255, green: 9/255, blue: 69/255))
                    .padding(.horizontal)

                sectionToggle(
                    icon: "bell",
                    text: "Notificarme reacciones",
                    isOn: Binding(
                        get: { nsc.isReactionsEnabled },
                        set: {
                            nsc.isReactionsEnabled = $0
                            nsc.updateStatesFromIndividualToggles()
                        }
                    )
                )

                Text("Procesos de revisión")
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color(red: 4/255, green: 9/255, blue: 69/255))
                    .padding(.horizontal)

                sectionToggle(
                    icon: "bell",
                    text: "Notificarme procesos",
                    isOn: Binding(
                        get: { nsc.isReviewEnabled },
                        set: {
                            nsc.isReviewEnabled = $0
                            nsc.updateStatesFromIndividualToggles()
                        }
                    )
                )

                Text("Reportes recomendados")
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color(red: 4/255, green: 9/255, blue: 69/255))
                    .padding(.horizontal)

                sectionToggle(
                    icon: "bell",
                    text: "Notificarme reportes",
                    isOn: Binding(
                        get: { nsc.isReportsEnabled },
                        set: {
                            nsc.isReportsEnabled = $0
                            nsc.updateStatesFromIndividualToggles()
                        }
                    )
                )
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
