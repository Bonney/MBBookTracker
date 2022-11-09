//
//  MyBooksView.swift
//  MBBookTracker
//
//  Created by Matt Bonney on 11/9/22.
//

import SwiftUI

struct MyBooksView: View {
    @State private var search = ""
    var body: some View {
        NavigationStack {
            List {
                Section {
                    HomeFeedCell(showHeader: false, showAddButton: false, showReview: false)

                    VStack {
                        Button { } label: {
                            Text("Update Progress")
                        }
                        .buttonStyle(.borderedProminent)
                        .controlSize(.small)
                        
                        ProgressView(value: 65, total: 100) {
                            HStack {
                                Text("Total Read")
                                Spacer()
                                Text("65%")
                            }
                        }
                        .font(.caption)

                    }

                } header: {
                    Text("Currently Reading")
                }
                .headerProminence(.increased)

                Section {
                    NavigationLink(value: "Want to Read") {
                        LabeledContent {
                            Text("7 Books")
                        } label: {
                            Label("Want to Read", systemImage: "book")
                        }
                    }

                    NavigationLink(value: "Completed") {
                        LabeledContent {
                            Text("18 Books")
                        } label: {
                            Label("Completed", systemImage: "books.vertical")
                        }
                    }

                    Button { } label: {
                        Label("Create a New Shelf", systemImage: "plus")
                    }

                } header: {
                    Text("Shelves")
                }

                Section {
                    Label {
                        Text("Kindle Notes & Highlights")
                    } icon: {
                        Image(systemName: "highlighter")
                            .foregroundStyle(.tint)
                    }

                    Label {
                        ProgressView(value: 18, total: 50) {
                            Text("2022 Reading Challenge")
                        } currentValueLabel: {
                            HStack {
                                Text("18 of 50 books read")
                                Spacer()
                                Text("36% complete")
                            }
                        }
                    } icon: {
                        Image(systemName: "medal")
                            .foregroundStyle(.tint)
                    }

                } header: {
                    Text("Reading Activity")
                }

            }
            .navigationTitle("My Books")
            .searchable(text: $search, placement: .navigationBarDrawer(displayMode: .always), prompt: Text("Books, Authors, Genres"))
            .navigationTitle("Goodreads")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    plusButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
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

    func plusButton() -> some View {
        Menu {
            Button { } label: {
                Label("Add Book", systemImage: "book")
            }
            Button { } label: {
                Label("New Shelf", systemImage: "tray")
            }
        } label: {
            Image(systemName: "plus")
        }
    }
}

struct MyBooksView_Previews: PreviewProvider {
    static var previews: some View {
        MyBooksView()
    }
}
