//
//  StatistiqueView.swift
//  ServiceDeskMobile
//
//  Created by Hind Manouzi (Étudiant) on 2026-10-16.
//
import SwiftUI

struct StatistiqueView: View {
    let nombre: Int
    let libelle: String

    var body: some View {
        VStack(spacing: 5) {
            Text("\(nombre)")
                .font(.system(.largeTitle, design: .rounded, weight: .bold))
                .foregroundStyle(.tint)
                .shadow(color: .black.opacity(0.08), radius: 6, y: 3)
            Text("\(libelle)")
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 150)
        .background(Color.accentColor.opacity(0.15), in: RoundedRectangle(cornerRadius: 12))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    StatistiqueView(nombre: 3, libelle: "New")
}
