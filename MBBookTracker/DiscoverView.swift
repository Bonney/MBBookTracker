//
//  DiscoverView.swift
//  MBBookTracker
//
//  Created by Matt Bonney on 11/9/22.
//

import SwiftUI

struct DiscoverView: View {
    @State private var search = ""
    var body: some View {
        NavigationStack {
            List {
                genreSection()

                Section {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(0..<10) { _ in
                                HomeFeedCell(showHeader: false, showAddButton: true, showStars: false, showReview: false)
                                    .frame(width: 260)
                                    .padding(.leading, 8)
                            }
                        }
                        .padding(.bottom, 8)
                    }
                    .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))

                    NavigationLink(value: "Because You Liked...") {
                        Text("See All")
                    }
                } header: {
                    Text("Because you enjoyed \("The 7½ Deaths of Evelyn Hardcastle")")
                }
                .headerProminence(.increased)

                Section {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(0..<10) { _ in
                                HomeFeedCell(showHeader: false, showAddButton: true, showReview: false)
                                    .frame(width: 200, height: 200)
                                    .padding(.leading, 8)
                            }
                        }
                        .padding(.bottom, 8)
                    }
                    .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
                } header: {
                    Text("Trending on Goodreads")
                }
                .headerProminence(.increased)

            }
            .searchable(text: $search, placement: .navigationBarDrawer(displayMode: .always), prompt: Text("Title, Author or ISBN"))
            .navigationTitle("Discover")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    notificationsButton()
                }
            }
        }
    }

    func genreSection() -> some View {
        Section {
            TabView {
                genreBox(title: "Sci-Fi", symbol: "light.beacon.max", color: Color.orange)
                genreBox(title: "Mystery", symbol: "magnifyingglass", color: Color.purple)
                genreBox(title: "Fantasy", symbol: "star", color: Color.blue)
                genreBox(title: "Autobiography", symbol: "figure.arms.open", color: Color.green)
            }
            .frame(height: 150)
            .listRowInsets(EdgeInsets())
            .tabViewStyle(.page(indexDisplayMode: .always))
        } header: {
            Text("Popular Genres")
        }
        .headerProminence(.increased)
    }

    func genreBox(title: String, symbol: String, color: Color) -> some View {
        Rectangle().foregroundStyle(color.gradient)
            .frame(height: 150)
            .listRowInsets(EdgeInsets())
            .overlay(alignment: .center) {

                Image(systemName: symbol)
                    .resizable(resizingMode: .tile)
                    .padding(-4)
                    .foregroundStyle(.tertiary)
                    .blendMode(.overlay)

                Text(title)
                    .font(.title.weight(.bold))
                    .padding()
                    .foregroundStyle(.thickMaterial)
                    .shadow(radius: 4)
            }
    }

    func notificationsButton() -> some View {
        Button { } label: {
            Image(systemName: "bell.badge")
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
