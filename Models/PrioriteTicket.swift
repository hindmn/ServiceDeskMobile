//
//  PrioriteTicket.swift
//  ServiceDeskMobile
//
//  Créé par Khalil Loghlam.
//  420-249-AH — Projet 1
//

import Foundation

/// Priorité d'un ticket, de la moins urgente à la plus urgente.
enum PrioriteTicket: Int, Codable, CaseIterable, Identifiable, Comparable {
    case basse = 0
    case moyenne = 1
    case haute = 2
    case critique = 3

    var id: Int { rawValue }

    /// Texte affiché à l'écran.
    var libelle: String {
        switch self {
        case .basse: return "Basse"
        case .moyenne: return "Moyenne"
        case .haute: return "Haute"
        case .critique: return "Critique"
        }
    }

    static func < (gauche: PrioriteTicket, droite: PrioriteTicket) -> Bool {
        gauche.rawValue < droite.rawValue
    }
}
