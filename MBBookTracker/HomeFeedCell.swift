//
//  HomeFeedCell.swift
//  MBBookTracker
//
//  Created by Matt Bonney on 11/9/22.
//

import SwiftUI

struct HomeFeedCell: View {
    var color: Color = Color.init(hue: Double.random(in: 0...360)/360, saturation: 1.0, brightness: 1.0)
    var showHeader: Bool
    var showAddButton: Bool
    var showReview: Bool

    init(showHeader: Bool = true, showAddButton: Bool = true, showReview: Bool = true) {
        self.showHeader = showHeader
        self.showAddButton = showAddButton
        self.showReview = showReview
    }

    var body: some View {
        VStack(alignment: .leading) {
            if showHeader {
                personHeader()
                Divider()
            }

            bookDetails()

            if showAddButton {
                addToLibraryButton()
            }

            if showReview {
                Divider()
                    .padding(.vertical, 4)

                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris bibendum, mi sit amet porta cursus, tortor mauris volutpat libero, ut laoreet mi diam eu sem. Integer volutpat in nisl id ornare. Fusce vulputate lorem lectus, a ultrices libero feugiat at. Curabitur tincidunt congue enim, mollis finibus neque faucibus et. Vivamus eget lacus id est tincidunt bibendum at sit amet eros. Suspendisse eget vulputate ante, non fringilla urna. Fusce vel iaculis tortor, non imperdiet justo. Donec ultricies ante a nulla luctus, laoreet ultricies mi venenatis. In rutrum pulvinar eros, interdum ultrices leo porta eu. Aenean ultrices id purus laoreet eleifend. Ut malesuada nunc ligula, ut posuere diam fringilla quis.")
                    .lineLimit(3)
                    .font(.subheadline)

                HStack {
                    Button { } label: {
                        Label("3 Likes", systemImage: "hand.thumbsup")
                            .foregroundStyle(.primary)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }

                    Button { } label: {
                        Label("Comment", systemImage: "bubble.right")
                            .foregroundStyle(.primary)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
                .symbolVariant(.fill)
                .buttonStyle(.bordered)
                .controlSize(.small)
                .padding(.vertical, 4)
            }
        }
    }

    @ViewBuilder func personHeader() -> some View {
        HStack(spacing: 4) {
            HStack {
                Image(systemName: "person.circle.fill")
                    .foregroundStyle(color)
                Text("Matt")
                    .fontWeight(.semibold)
            }
            .padding(2)
            .padding(.horizontal, 2)
            .padding(.trailing, 3)
            .background(color.opacity(0.15), in: Capsule())

            Text("finished reading")

            Spacer()

            Text("21h")
                .foregroundStyle(.secondary)
        }
        .font(.subheadline)
    }

    var bookHeight: Double = 100
    var bookWidth: Double { bookHeight * 2/3 }

    func bookDetails() -> some View {
        HStack(alignment: .top) {

            RoundedRectangle(cornerRadius: 4, style: .continuous)
                .frame(width: bookWidth, height: bookHeight)
                .foregroundStyle(color)
                .overlay(alignment: .top) {
                    Image(systemName: "bookmark.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .foregroundStyle(.regularMaterial)
                }

            VStack(alignment: .leading, spacing: 8) {

                bookTitle()

                HStack(spacing: 1) {
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star")
                }
                .foregroundStyle(.orange)
                .imageScale(.small)

                Text("Read from 07/15/22 – 11/07/22")
                    .font(.caption)
                    .foregroundStyle(.secondary)

            }

        }
    }

    func bookTitle() -> some View {
        VStack(alignment: .leading) {
            Text("The 7½ Deaths of Evelyn Hardcastle")
                .font(.system(.body, design: .serif))
                .fontWeight(.medium)
                .foregroundStyle(.primary)
                .fixedSize(horizontal: false, vertical: true)

            Text("by Stuart Turton")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }

    func addToLibraryButton() -> some View {
        Menu {
            Section {
                Button { } label: { Label("Want to Read", systemImage: "book") }
                Button { } label: { Label("Currently Reading", systemImage: "bookmark") }
                Button { } label: { Label("Completed", systemImage: "books.vertical") }
            } header: {
                Text("The 7 ½ Deaths of Evelyn Hardcastle")
            }
        } label: {
            Text("Add to Library")
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .menuStyle(.button)
        .buttonStyle(.borderedProminent)
        .controlSize(.regular)
    }


}

struct HomeFeedCell_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            List {
                Section {
                    HomeFeedCell()
                }
                Section {
                    HomeFeedCell(showHeader: false)
                }
                Section {
                    HomeFeedCell(showAddButton: false)
                }
                Section {
                    HomeFeedCell(showReview: false)
                }
                Section {
                    HomeFeedCell(showHeader: false, showAddButton: false, showReview: false)
                }
            }
        }
    }
}
