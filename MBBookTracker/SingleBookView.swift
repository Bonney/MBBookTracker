//
//  SingleBookView.swift
//  MBBookTracker
//
//  Created by Matt Bonney on 11/14/22.
//

import SwiftUI

struct SingleBookView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    bookDetails()
                    bookDetails()
                    bookDetails()
                } header: {
                    Color.clear.frame(height: 300)
                        .overlay {
                            VStack {
                                bookCover()

                                VStack {
                                    Text("The Three Month Rule")
                                        .font(.system(.title2, design: .serif, weight: .semibold))
                                        .fixedSize(horizontal: true, vertical: false)
                                        .foregroundStyle(.regularMaterial)

                                    Text("Lorna Alvarado")
                                        .font(.subheadline)
                                        .fontWidth(.expanded)
                                        .textCase(.uppercase)
                                        .foregroundStyle(.regularMaterial)
                                }
                                .padding()
                                .environment(\.colorScheme, .dark)
                            }
                        }
                        .textCase(.none)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.insetGrouped)
            .scrollContentBackground(.hidden)
            .background(alignment: .top) {
                Image("bookcover")
                    .resizable()
                    .blur(radius: 20, opaque: true)
                    .overlay(.thinMaterial)
                    .mask {
                        LinearGradient(colors: [.black, .black.opacity(0.1)], startPoint: .top, endPoint: .bottom)
                    }
                    .ignoresSafeArea()
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    SheetDismissButton(label: .done)
                }
            }
        }
    }

    func bookCover() -> some View {
        Image("bookcover")
            .resizable()
            .aspectRatio(2/3, contentMode: .fit)
            .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
            .shadow(radius: 20)
    }

    func bookDetails() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("The 7 ½ Deaths of Evelyn Hardcastle")
                .font(.system(.headline, design: .serif))
                .fontWeight(.medium)
                .foregroundStyle(.primary)
                .fixedSize(horizontal: false, vertical: true)

            Text("by Stuart Turton")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text("Mystery")
                .font(.caption)
                .fontWeight(.semibold)
                .textCase(.uppercase)
                .foregroundStyle(.tint)
        }
    }
}

struct SingleBookView_Previews: PreviewProvider {
    static var previews: some View {
        SingleBookView()
    }
}
