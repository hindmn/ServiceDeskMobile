//
//  TicketsRowView.swift
//  ServiceDeskMobile
//
//  Created by Hind Manouzi (Étudiant) on 2026-10-17.
//
import SwiftUI

struct TicketsRowView: View {
    let ticket: Ticket
    var body: some View {
        HStack(spacing: 12){
            Image(systemName: ticket.categorie.icone).font(.title2)
                .foregroundStyle(.white)
                .frame(width: 38, height: 38)
                .background(Color.accentColor.gradient, in: Circle())
            VStack(alignment: .leading, spacing: 4){
                Text(ticket.titre)
                    .font(.headline)
                Text("\(ticket.categorie.libelle) - Priorité : \(ticket.priorite.libelle) - Statut : \(ticket.statut.libelle)")
                    .font(.caption)
                    .foregroundStyle(ticket.priorite == .critique ? .red : .secondary)
            }
            .padding(.vertical, 4)
        }
    }
}

#Preview {
    TicketsRowView(ticket: DonneesDemo.tickets()[0])
}
