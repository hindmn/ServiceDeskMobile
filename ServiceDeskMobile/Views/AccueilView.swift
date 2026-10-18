//
//  AccueilView.swift
//  ServiceDeskMobile
//
//  Created by Hind Manouzi (Étudiant) on 2026-10-16.
//
import SwiftUI

struct AccueilView: View {
    let ticketsViewModel: TicketsViewModel
    @Binding var sectionSelectionnee: Onglet
    @State private var afficherNewTicket = false

    private let rows = [GridItem(.adaptive(minimum: 140), spacing: 14)]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    header
                    if ticketsViewModel.nbTicketsCritique > 0 { alerteCritique }
                    statistiques
                    param
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Accueil")
            .sheet(isPresented: $afficherNewTicket) {
                FormulaireView {
                    ticket in ticketsViewModel.ajouterTicket(ticket)
                }
            }
        }
    }

    private var header: some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 6) {
                Text("Tableau de bord")
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(.white.opacity(0.8))
                Text("\(ticketsViewModel.nbTotalTickets)")
                    .font(
                        .system(.largeTitle, design: .rounded, weight: .heavy)
                    )
                Text(
                    ticketsViewModel.nbTotalTickets > 1
                        ? "tickets au total" : "ticket au total"
                )
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.85))
            }
            Spacer(minLength: 0)
            anneauDeResolu
        }
        .foregroundStyle(.white)
        .padding(20)
        .frame(maxWidth: .infinity)
        .background(backgroundCard)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .shadow(color: .indigo.opacity(0.35), radius: 16, y: 8)
    }

    private var backgroundCard: some View {
        ZStack {
            LinearGradient(
                colors: [.purple, .indigo, .blue],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            Circle().fill(.white.opacity(0.12))
                .frame(width: 180, height: 180)
                .offset(x: 120, y: -70)
            Circle().fill(.white.opacity(0.12))
                .frame(width: 120, height: 120)
                .offset(x: -130, y: 60)
        }
    }

    private var anneauDeResolu: some View {
        ZStack {
            Circle().stroke(.white.opacity(0.25), lineWidth: 10)
            
            Circle().trim(from: 0, to: ticketsViewModel.resolution)
                .stroke(.white,
                    style: StrokeStyle(lineWidth: 10, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
            VStack(spacing: 0) {
                Text(
                    ticketsViewModel.resolution,
                    format: .percent.precision(.fractionLength(0))
                )
                .font(.headline.weight(.bold))
                Text("traités").font(.caption2)
            }
        }
        .frame(width: 86, height: 86)
        .animation(.easeInOut, value: ticketsViewModel.resolution)
    }

    private var alerteCritique: some View {
        let nb = ticketsViewModel.nbTicketsCritique
        let pluriel = nb > 1 ? "s" : ""
        return Button {
            ticketsViewModel.afficherPrioriteCritique()
            sectionSelectionnee = .tickets
        } label: {
            HStack(spacing: 12) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.title3)
                    .foregroundStyle(.white)
                    .padding(10)
                    .background(.red.gradient, in: Circle())
                VStack(alignment: .leading, spacing: 2) {
                    Text("\(nb) ticket\(pluriel) critique\(pluriel)")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                    Text("À traiter en priorité")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                Spacer()
                Image(systemName: "chevron.right").foregroundStyle(.tertiary)
            }
            .padding()
            .background(
                Color.red.opacity(0.12),
                in: RoundedRectangle(cornerRadius: 18)
            )
        }
        .buttonStyle(.plain)
    }

    private var statistiques: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Par statut").font(.title3.bold())

            LazyVGrid(columns: rows, spacing: 10) {
                ForEach(StatutTicket.allCases) { statut in
                    StatistiqueView(
                        nombre: ticketsViewModel.nbTickets(statut: statut),
                        total: ticketsViewModel.nbTotalTickets,
                        libelle: statut.libellePluriel,
                        icone: icone(pour: statut),
                        couleur: couleur(pour: statut)
                    )
                }
            }
        }
    }

    private func icone(pour statut: StatutTicket) -> String {
        switch statut {
        case .nouveau: return "sparkles"
        case .enCours: return "hammer.fill"
        case .resolu: return "checkmark.circle.fill"
        case .ferme: return "lock.fill"
        }
    }

    private func couleur(pour statut: StatutTicket) -> Color {
        switch statut {
        case .nouveau: return .blue
        case .enCours: return .orange
        case .resolu: return .green
        case .ferme: return .gray
        }
    }
    private var param: some View {
        VStack(alignment: .leading, spacing: 12){
            Text("Accès rapide").font(.title3.bold())
            HStack(spacing: 14) {
                tuileAction(titre: "Nouveau ticket", icone: "plus", couleur: .blue){
                    afficherNewTicket = true
                }
                tuileAction(titre: "Tous les tickets", icone: "list.bullet", couleur: .blue){
                    sectionSelectionnee = .tickets
                }
            }
        }
    }

    private func tuileAction(
        titre: String,
        icone: String,
        couleur: Color,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 12) {
                Image(systemName: icone)
                    .font(.title3.weight(.semibold))
                    .foregroundStyle(.white)
                    .frame(width: 44, height: 44)
                    .background(
                        couleur.gradient,
                        in: RoundedRectangle(cornerRadius: 12)
                    )
                Text(titre).font(.headline).foregroundStyle(.primary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(
                Color(.secondarySystemGroupedBackground),
                in: RoundedRectangle(cornerRadius: 18)
            )
            .shadow(color: .black.opacity(0.06), radius: 8, y: 4)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    AccueilView(
        ticketsViewModel: TicketsViewModel(),
        sectionSelectionnee: .constant(.accueil)
    )
}
