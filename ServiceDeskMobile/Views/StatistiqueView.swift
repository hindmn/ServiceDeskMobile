//
//  StatistiqueView.swift
//  ServiceDeskMobile
//
//  Created by Hind Manouzi (Étudiant) on 2026-10-16.
//
import SwiftUI

struct StatistiqueView: View {
    let nombre: Int
    let nom: String
    
    var body: some View {
        VStack(spacing: 5){
            Text("\(nombre)")
                .font(.title2)
            Text("\(nom)")
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 150)
        .background(.gray.opacity(0.12))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    StatistiqueView(nombre: 3, nom: "New")
}
