//
//  CategorieTicket.swift
//  ServiceDeskMobile
//
//  Créé par Khalil Loghlam.
//  420-249-AH — Projet 1
//

import Foundation

/// Catégorie d'un ticket de support.
enum CategorieTicket: String, Codable, CaseIterable, Identifiable {
    case materiel
    case logiciel
    case reseau
    case compteUtilisateur
    case imprimante
    case autre

    var id: String { rawValue }

    /// Texte affiché à l'écran.
    var libelle: String {
        switch self {
        case .materiel: return "Matériel"
        case .logiciel: return "Logiciel"
        case .reseau: return "Réseau"
        case .compteUtilisateur: return "Compte utilisateur"
        case .imprimante: return "Imprimante"
        case .autre: return "Autre"
        }
    }

    /// Nom du SF Symbol associé à la catégorie.
    var icone: String {
        switch self {
        case .materiel: return "desktopcomputer"
        case .logiciel: return "apps.iphone"
        case .reseau: return "wifi"
        case .compteUtilisateur: return "person.crop.circle"
        case .imprimante: return "printer"
        case .autre: return "ellipsis.circle"
        }
    }
}
