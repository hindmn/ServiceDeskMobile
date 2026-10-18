//
//  ParametreView.swift
//  ServiceDeskMobile
//
//  Created by Hind Manouzi (Étudiant) on 2026-10-16.
//
import SwiftUI

struct ParametreView: View {
    let ticketsViewModel: TicketsViewModel
    @Bindable var parametresViewModel: ParametreViewModel
    @State private var confirmation = false

    var body: some View {
        NavigationStack {
            Form {
                Section("Affichage") {
                    Toggle(isOn: $parametresViewModel.modeSombre) {
                        Label("Mode sombre", systemImage: "moon.fill")
                    }.tint(.purple)
                }
                Section("Données") {
                    Button(role: .destructive) {
                        confirmation = true
                    } label: {
                        Label(
                            "Réinitialiser les données",
                            systemImage: "arrow.counterclockwise"
                        )
                    }
                }
            }
            .navigationTitle("Paramètres")
            .confirmationDialog(
                "Voulez-vous réinitialiser vos données ?",
                isPresented: $confirmation,
                titleVisibility: .visible
            ) {
                Button("Réinitialiser", role: .destructive) {
                    ticketsViewModel.reinitialiser()
                }
                Button("Annuler", role: .cancel) {}
            } message: {
                Text("Tous vos tickets seront supprimés!")
            }
        }
    }
}

#Preview {
    ParametreView(
        ticketsViewModel: TicketsViewModel(),
        parametresViewModel: ParametreViewModel()
    )
}
