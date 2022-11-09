//
//  HomeView.swift
//  MBBookTracker
//
//  Created by Matt Bonney on 11/9/22.
//

import SwiftUI

struct HomeView: View {
    @State private var search = ""
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<20) { _ in
                    Section {
                        HomeFeedCell()
                    }
                }

            }
            .searchable(text: $search, placement: .navigationBarDrawer(displayMode: .always), prompt: Text("Title, Author or ISBN"))
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    AccountButton()
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    cameraScanButton()
                    notificationsButton()
                }
            }
        }
    }

    func notificationsButton() -> some View {
        Button { } label: {
            Image(systemName: "bell.badge")
        }
    }

    func cameraScanButton() -> some View {
        Button { } label: {
            Image(systemName: "camera.viewfinder")
        }
    }


}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
