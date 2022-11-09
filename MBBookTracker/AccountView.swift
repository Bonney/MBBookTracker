//
//  AccountView.swift
//  MBBookTracker
//
//  Created by Matt Bonney on 11/9/22.
//

import SwiftUI

struct AccountView: View {
    @State private var feedView: Int = 0

    var body: some View {
        NavigationStack {
            List {
                statsSection()
                feedSection()
            }
            .navigationTitle("Matt Bonney")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    SheetDismissButton(label: .done)
                }
            }
        }
    }

    func statsSection() -> some View {
        Section {
            Grid {
                GridRow {
                    Circle()
                        .frame(width: 44, height: 44)
                        .foregroundStyle(Color(hue: Double.random(in: 0...1), saturation: 1.0, brightness: 1.0).gradient)
                        .overlay {
                            Image(systemName: "person.fill")
                                .foregroundStyle(.ultraThickMaterial)
                        }
                        .padding(.trailing)

                    headerCell(value: 25, label: "Books")
                    headerCell(value: 13, label: "Friends")
                    headerCell(value: 2, label: "Following")
                }
            }
        }
    }

    func feedSection() -> some View {
        Section {
            Picker("View", selection: $feedView) {
                Text("Activity").tag(0)
                Text("About").tag(1)
            }
            .pickerStyle(.segmented)
            .textCase(.none)

            if feedView == 0 {
                activityFeed()
            } else {
                aboutFeed()
            }
        }
    }

    func activityFeed() -> some View {
        ForEach(0..<10) { _ in
            Section {
                HomeFeedCell(showHeader: true, showAddButton: false, showReview: true)
            }
        }
    }

    func aboutFeed() -> some View {
        Text("About Feed.")
    }

    func headerCell(value: Int, label: String) -> some View {
        VStack(alignment: .leading, spacing: nil) {
            Text(String(value))
                .font(.title3)

            Text(label)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
