//
//  InformationTicket.swift
//  ServiceDeskMobile
//
//  Created by Hind Manouzi (Étudiant) on 2026-10-17.
//
import SwiftUI

struct InformationTicketView: View {
    let ticketsVewModel: TicketsViewModel
    let ticketID: UUID

    @Environment(\.dismiss) private var dismiss
    @State private var confirmation = false
    @State private var confimSupp = false

    var body: some View {
        if let ticket = ticketsVewModel.ticket(withId: ticketID) {
            information(ticket)
        } else {
            Text("Aucun ticket").foregroundStyle(.secondary)
        }
    }
    private func affichage(_ titre: String, _ value: String, icone: String)
        -> some View
    {
        HStack {
            Label(titre, systemImage: icone)
            Spacer()
            Text(value).foregroundStyle(.secondary).multilineTextAlignment(
                .trailing
            )
        }
    }
    private func information(_ ticket: Ticket) -> some View {
        List {
            Section {
                Text(ticket.titre).font(.title2).bold()
            }
            Section("Description") {
                Text(
                    ticket.description.isEmpty
                        ? "Aucune description" : ticket.description
                )
            }
            Section("Informations supplémentaires") {
                affichage(
                    "Catégorie",
                    ticket.categorie.libelle,
                    icone: ticket.categorie.icone
                )
                affichage(
                    "Priorité",
                    ticket.priorite.libelle,
                    icone: "exclamationmark.triangle"
                )
                affichage(
                    "Statut",
                    ticket.statut.libelle,
                    icone: "checkmark.circle.fill"
                )
                affichage(
                    "Date de création",
                    ticket.dateCreation.formatted(
                        date: .long,
                        time: .shortened
                    ),
                    icone: "calendar"
                )
                Button(role: .destructive) {
                    confimSupp = true
                } label: {
                    Label("Supprimer", systemImage: "trash")
                }
            }
        }
        .navigationTitle("Information")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("Modifier") {
                    confirmation = true
                }
            }
        }
        .sheet(isPresented: $confirmation) {
            FormulaireView(ticket: ticket) {
                ticketModif in ticketsVewModel.modifierTicket(ticketModif)
            }
        }
        .alert("Supprimer", isPresented: $confimSupp){
            Button("Supprimer", role: .destructive){
                ticketsVewModel.supprimer(id: ticketID)
                dismiss()
            }
        }message: {
            Text("Voulez-vous vraiment supprimer ce ticket ?")
        }
    }
}

#Preview {
    let ticketViewModel = TicketsViewModel()
    return NavigationStack {
        InformationTicketView(
            ticketsVewModel: ticketViewModel,
            ticketID: ticketViewModel.tickets[0].id
        )
    }
}
