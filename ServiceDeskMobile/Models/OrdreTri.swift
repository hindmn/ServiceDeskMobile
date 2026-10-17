//
//  OrdreTri.swift
//  ServiceDeskMobile
//
//  Created by Hind Manouzi (Étudiant) on 2026-10-17.
//
import SwiftUI

enum OrdreTri: String, CaseIterable, Identifiable {
    case plusRecent, plusAncien, croissant, decroissant
    var id: String{rawValue}
    var titre: String {
        switch self{
        case .plusRecent: return "Plus récent"
        case .plusAncien: return "Plus ancien"
        case .croissant: return "Priorité croissante"
        case .decroissant: return "Priorité décroissante"
        }
    }
}
