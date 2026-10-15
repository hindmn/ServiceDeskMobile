//
//  Ticket.swift
//  ServiceDeskMobile
//
//  Created by Hind Manouzi (Étudiant)
//  420-249-AH — Projet 1
//

import Foundation

/// Demande de support informatique.
struct Ticket: Identifiable, Codable, Hashable {
    let id: UUID
    var titre: String
    var description: String
    var categorie: CategorieTicket
    var priorite: PrioriteTicket
    var statut: StatutTicket
    let dateCreation: Date

    init(
        id: UUID = UUID(),
        titre: String,
        description: String,
        categorie: CategorieTicket,
        priorite: PrioriteTicket,
        statut: StatutTicket = .nouveau,
        dateCreation: Date = Date()
    ) {
        self.id = id
        self.titre = titre
        self.description = description
        self.categorie = categorie
        self.priorite = priorite
        self.statut = statut
        self.dateCreation = dateCreation
    }
}
