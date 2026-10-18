//
//  StatistiqueView.swift
//  ServiceDeskMobile
//
//  Created by Hind Manouzi (Étudiant) on 2026-10-16.
//
import SwiftUI

struct StatistiqueView: View {
    let nombre: Int
    let total: Int
    let libelle: String
    let icone: String
    let couleur: Color

    private var proportion: Double {
        total > 0 ? Double(nombre) / Double(total) : 0
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 5) {
                Image(systemName: icone).font(.headline)
                    .foregroundStyle(couleur)
                    .frame(width: 36, height: 36)
                    .background(couleur.opacity(0.15), in: Circle())
                Spacer()
                Text("\(nombre)")
                    .font(.system(.title, design: .rounded, weight: .bold))
            }
            Text("\(libelle)")
                .font(.subheadline.weight(.medium))
                .foregroundStyle(.secondary)
            ProgressView(value: proportion).tint(couleur)
        }
        .padding()
        .background(
            Color(.secondarySystemGroupedBackground),
            in: RoundedRectangle(cornerRadius: 18)
        )
        .shadow(color: .black.opacity(0.06), radius: 8, y: 4)
    }
}

#Preview {
    StatistiqueView(
        nombre: 3,
        total: 12,
        libelle: "Nouveaux",
        icone: "sparkles",
        couleur: .blue
    )
    .padding()
}
