//
//  StatutTicket.swift
//  ServiceDeskMobile
//
//  Créé par Khalil Loghlam.
//  420-249-AH — Projet 1
//

import Foundation

/// Statut d'un ticket.
enum StatutTicket: String, Codable, CaseIterable, Identifiable {
    case nouveau
    case enCours
    case resolu
    case ferme

    var id: String { rawValue }

    /// Texte affiché à l'écran.
    var libelle: String {
        switch self {
        case .nouveau: return "Nouveau"
        case .enCours: return "En cours"
        case .resolu: return "Résolu"
        case .ferme: return "Fermé"
        }
    }

    /// Texte affiché à l'écran, au pluriel.
    var libellePluriel: String {
        switch self {
        case .nouveau: return "Nouveaux"
        case .enCours: return "En cours"
        case .resolu: return "Résolus"
        case .ferme: return "Fermés"
        }
    }
}
