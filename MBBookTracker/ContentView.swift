//
//  ContentView.swift
//  MBBookTracker
//
//  Created by Matt Bonney on 11/9/22.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            MyBooksView()
                .tabItem {
                    Label("My Books", systemImage: "book.closed")
                }

            DiscoverView()
                .tabItem {
                    Label("Discover", systemImage: "safari")
                }

            Text("Challenges")
                .tabItem {
                    Label("Challenges", systemImage: "medal")
                }

            Text("Friends")
                .tabItem {
                    Label("Friends", systemImage: "person.2")
                }


            Text("Recommendations")
                .tabItem {
                    Label("Recommendations", systemImage: "star")
                }

            Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: "slider.horizontal.3")
                }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
