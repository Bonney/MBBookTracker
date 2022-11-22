//
//  NotificationsButton.swift
//  MBBookTracker
//
//  Created by Matt Bonney on 11/10/22.
//

import SwiftUI

struct NotificationsButton: View {
    @State private var sheet: Bool = false

    var body: some View {
        Button {
            sheet.toggle()
        } label: {
            Image(systemName: "bell.badge")
        }
        .sheet(isPresented: $sheet) {
            placeholderSheetView()
        }
    }

    func placeholderSheetView() -> some View {
        NavigationStack {
            VStack {
                Image(systemName: "bell.badge")
                    .font(.largeTitle)
                    .padding()
                Text("No Notifications")
            }
            .foregroundStyle(.secondary)
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    SheetDismissButton(label: .done)
                }
            }
        }
    }
}
struct NotificationsButton_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsButton()
    }
}
