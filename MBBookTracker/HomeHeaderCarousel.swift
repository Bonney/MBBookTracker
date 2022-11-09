//
//  HomeHeaderCarousel.swift
//  MBBookTracker
//
//  Created by Matt Bonney on 11/9/22.
//

import SwiftUI

struct HomeHeaderCarousel: View {
    var body: some View {
        TabView {
            box(title: "Best November Books", description: "These are the books that Goodreads members are the most excited about this month.", symbol: "books.vertical.fill", foreground: Color.white, background: Color.green)

            box(title: "Best November Books", description: "These are the books that Goodreads members are the most excited about this month.", symbol: "books.vertical.fill", foreground: Color.black, background: Color.orange)

            box(title: "Best November Books", description: "These are the books that Goodreads members are the most excited about this month.", symbol: "books.vertical.fill", foreground: Color.white, background: Color.blue)
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
    }

    func box(title: String, description: String, symbol: String, foreground: Color, background: Color) -> some View {
        GroupBox {
            Text(description)
        } label: {
            Label(title, systemImage: symbol)
        }
        .padding(.horizontal)
    }
}

struct HomeHeaderCarousel_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeaderCarousel()
    }
}
